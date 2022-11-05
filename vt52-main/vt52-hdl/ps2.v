//*************************************************************************
//*  Контроллер клавиатуры PS/2
//*************************************************************************

module ps2 (

// шина wishbone
   input						wb_clk_i,	// тактовая частота шины
	input						wb_rst_i,	// сброс
	input	 [15:0]			wb_adr_i,	// адрес 
	input	 [15:0]			wb_dat_i,	// входные данные
   output reg [15:0]		wb_dat_o,	// выходные данные
	input						wb_cyc_i,	// начало цикла шины
	input	  					wb_we_i,		// разрешение записи (0 - чтение)
	input						wb_stb_i,	// строб цикла шины
	input	 [1:0]	      wb_sel_i,   // выбор конкретных байтов для записи - старший, младший или оба
	output reg				wb_ack_o,	// подтверждение выбора устройства

// обработка прерывания	
	output reg				irq,	      // запрос
	input						iack,    	// подтверждение

// клавиатура
   input 					ps2_clk,     // линия PS/2 clock
   input 					ps2_data      // линия PS/2 data
);
//
// Регистры устройства:
// 
// base+0 - регистр состояния:
//   D6 - IE   - разрешение прерывания
//   D7 - Done - окончание чтения сканкода, сбрасывается при чтении регистра данных
//
// base+2 - регистр данных, хранит прочитанный сканкод
//


reg[2:0] bitcount;   // счетчик битов в принимаемом пакете
reg[7:0] scancode;  // сканкод, считанный с клавиатуры 
reg rxdone;         // флаг окончания сбора сканкода
reg rxie;           // флаг разрешения прерывания
reg[7:0] cfilter;   // сдвиговый регистр фильтра сигнала ps/2 c
reg ps2clk_edge;     // признак перехода строба ps/2 cloc из 0 в 1
reg ps2clock;       // отфильтрованный сигнал ps/2 clock
reg parity;			  // бит четности	

// машина обработки состояния PS/2
parameter[1:0] ps2_state_idle = 0; 
parameter[1:0] ps2_state_data = 1; 
parameter[1:0] ps2_state_parity = 2; 
parameter[1:0] ps2_state_stop = 3; 
reg[1:0] ps2_state; 

wire bus_strobe;          // строб цикла шины
wire bus_read_req;        // запрос чтения
wire bus_write_req;       // запрос записи

//*******************************************************	
//*  Стробы шинных транзакций
//*******************************************************	
assign bus_strobe = wb_cyc_i & wb_stb_i;         // строб цикла шины
assign bus_read_req = bus_strobe & ~wb_we_i;     // запрос чтения
assign bus_write_req = bus_strobe & wb_we_i;     // запрос записи
// формирователь ответа на цикл шины	
wire reply=wb_cyc_i & wb_stb_i & ~wb_ack_o;
	
// Сигнал ответа 
always @(posedge wb_clk_i or posedge wb_rst_i)
   if (wb_rst_i == 1) wb_ack_o <= 0;
 else wb_ack_o <= reply;

//=============================================================================
always @(posedge wb_clk_i) begin
  if (wb_rst_i == 1'b1) begin
   // сброс 
    rxdone <= 1'b0 ; 
    rxie <= 1'b0 ; 
    ps2clock <= 1'b0 ; 
    cfilter <= {8{1'b1}} ; 
    scancode <= {8{1'b0}} ; 
    ps2_state <= ps2_state_idle ; 
    ps2clk_edge <= 1'b0 ; 
    irq <= 1'b0 ; 
   end

	// рабочие состояния
   else  begin
		
	//**********************************************
   // Формирователь запроса прерывания
	//**********************************************
	if (rxie == 1'b1 & rxdone == 1'b1 & irq == 1'b0 & iack == 1'b0) begin
		// возникло состояние rx_done - прочитан санкод, генерируем прерывание
		irq <= 1'b1 ;    // выставляем на шину запрос прерывания
	end 
	// обработка подтвержденного прерывания
	else  if (iack == 1'b1) begin  // процессор подтвердил прерывание 
		irq <= 1'b0 ;           // снимем запрос
	end 

	//**********************************************
	//* Связь с шиной
	//**********************************************

	// чтение регистров
   if (bus_read_req)  begin
        case (wb_adr_i[2:1])
           2'b00 :  // регистр состояния
                   wb_dat_o <= {8'b00000000, rxdone, rxie, 6'b000000} ; 
           2'b01 :  // регистр данных (сканкод)
                begin
                   rxdone <= 1'b0 ;    // сбрасываем бит done при чтении данных
                   wb_dat_o <= {8'b00000000, scancode} ; 
                end
        endcase 
    end 
			
	 // запись регистров
    if (bus_write_req)  
	   // возможна только словная запись или запись младшего байта регистра CSR
      if ((wb_sel_i[0] == 1) & (wb_adr_i[1] == 1'b0))	rxie <= wb_dat_i[6] ; // записывается только бит IE
 

   //**********************************************
   // Фильтрация сигнала ps/2 clock
	//**********************************************
   cfilter <= {cfilter[6:0], ps2_clk} ; // вводим сигнл ps/2 clock в сдвиговый регистр
			
	// накопилось 8 единиц - сигнал ps/2 clock стабилен и имеет высокий уровень
   if (cfilter == {8{1'b1}})  begin
        ps2clock <= 1'b1 ;        // отфильтрованный сигнал=1
        ps2clk_edge <= 1'b0 ; // нет перепада clock
   end
			
	// накопилось 8 нулей - сигнал ps/2 clock стабилен и имеет низкий уровень
   else if (cfilter == {8{1'b0}}) begin
        ps2clock <= 1'b0 ;        // отфильтрованный сигнал=0
        if (ps2clock == 1'b1) ps2clk_edge <= 1'b1 ; // зафиксирован переход от 1 к 0 - взводим сигнал перепада
        else  ps2clk_edge <= 1'b0 ; // перехода не было - опускаем сигнал перепада
   end 
			
	//*********************************************************************
	// Зафиксирован очередной перепад ps/2 clock - принимаем биты данных
	//*********************************************************************
   if (ps2clk_edge) 
     case (ps2_state)

 		 ps2_state_idle :
         // начало сбора данных
         begin
            ps2_state <= ps2_state_data ;  // переходим к сборке принимаемого байта
            bitcount <= 0 ; 
         end
               
		 ps2_state_data :
			// прием битов данных
         begin
            scancode[bitcount] <= ps2_data ; // принимаем очередной бит в буфер сканкода
            if (bitcount != 7) bitcount <= bitcount + 1'b1 ; // продвигаем счетчик битов
            else                  ps2_state <= ps2_state_parity ;  // приняты все 8 бит - переходим к приему бита четности
         end
								
       ps2_state_parity :
			// бит четности
			begin
           ps2_state <= ps2_state_stop ; 
			  parity <= ps2_data;
			end  
									
       ps2_state_stop :
         begin
			// окончание приема данных
           if (^scancode == ~parity) rxdone <= 1'b1 ;  // поднимаем флаг успешного приема, если четность правильная
           ps2_state <= ps2_state_idle ; // переходим к ожиданию следующего пакета
         end
     endcase 

	end  
end 
endmodule
