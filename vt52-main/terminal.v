//
// Этот файл - корень проекта. По сути, это просто оболочка для адаптации терминального модуля к конкретной используемой плате.
//
module terminal
(
   input    clk12,      // тактовая частота 50МГц
   input    resetbtn,   // кнопка сброса, необязательна       

	// консольный UART 
   output   uart_tx,
   input    uart_rx,
	
	// VGA
	output wire [7:0] TMDS,
   // output   vgah,         // строчный синхросигнал
   // output   vgav,         // кадровый синхросигнал
   // output   [1:0] vgar,   // шина DAC красного видеосигнала
   // output   [1:0] vgag,   // шина DAC зеленого видеосигнала
   // output   [1:0] vgab,   // шина DAC синего видеосигнала

	// управление звуком
	output   buzzer,
	
   // PS/2
   input    ps2_clk, 
   input    ps2_data

);
wire [2:0] initspeed;
wire clk50;

pll pll
(
  .inclk0 (clk12),
  .c0 (clk50),
  .c1(clock_dvi_s),    //125 MHz
  .locked (pll_locked)
);

wire   vgah;         // строчный синхросигнал
wire   vgav;         // кадровый синхросигнал
wire   [1:0] vgar;   // шина DAC красного видеосигнала
wire   [1:0] vgag;   // шина DAC зеленого видеосигнала
wire   [1:0] vgab;   // шина DAC синего видеосигнала

//   Настройка начальной скорости интерфейса
//---------------------------------------------
//            0 - 1200
//            1 - 2400
//            2 - 4800
//            3 - 9600
//            4 - 19200
//            5 - 38400
//            6 - 57600
//            7 - 115200
assign initspeed=3'd7; // начальная скорость 115200

wire reset;
wire pll_locked;

wire terminal_tx;
wire terminal_rx;

wire sound;         // управление звуковым сигналом

wire autoreset;     // автоматически генерируемый сброс
reg [5:0]resetcnt;  // счетчик задержки формирователя сброса

assign reset = ~resetbtn | autoreset | ~pll_locked;  // сброс от кнопки и стартового таймера
assign buzzer=~sound;                // выход управления звуком платы - инверсный (0-есть звук, 1-нет)

// линии UART, идут на выход платы без преобразования
assign uart_tx=terminal_tx;          
assign terminal_rx=uart_rx;

// цветовые выходы VGA 
wire vgared,vgagreen,vgablue;

// Этот вариант для случая, если на плате стоит несколькобитный DAC для управления яркостью пикселей
// В этом случае - это входые шины DAC  шириной в несколько бит
// выбор яркости каждого цвета, в данном случае - максимальная яркость
assign vgag = (vgagreen == 1'b1) ? 2'b11 : 2'b00 ;
assign vgab = (vgablue == 1'b1) ? 2'b11 : 2'b00 ;
assign vgar = (vgared == 1'b1) ? 2'b11 : 2'b00 ;

// А этот вариант для упрощенного подключения цветовых входов без DAC прямо к выходным пинам FPGA
// В этом случае цветовые линии vga{r,g,b}  - это просто провода, идущие от ножек платы к 
// разъему VGA через небольшой резистор (около 300 Ом).
//assign vgag = vgagreen;
//assign vgab = vgablue;
//assign vgar = vgared;

//**********************************
//*  Генерация начального сброса
//**********************************
assign autoreset= ~(&resetcnt);  // сигнал сброса снимается после того, 
                                 // как таймер досчитает до потолка
initial resetcnt=6'b000000;

always @ (posedge clk50) 
  if (resetcnt != 6'b111111)   // после достижения потолка таймер останавливается
     resetcnt <= resetcnt + 1'b1; 

//**********************************
//*   Терминал VT52
//**********************************
vt52 terminal(
   .vgahs(vgah),           // строчный синхросигнал
   .vgavs(vgav),           // кадровый синхросигнал
	.vgared(vgared),        // красный цвет
	.vgagreen(vgagreen),    // зеленый цвет
	.vgablue(vgablue),      // синий цвет
   .tx(terminal_tx),       // передатчик UART
   .rx(terminal_rx),       // приемник UART
   .ps2_clk(ps2_clk),      // синхросигнал PS/2
   .ps2_data(ps2_data),    // данные PS/2
	.buzzer(sound),         // разрешение звукового сигнала
	.initspeed(initspeed),  // начальная скорость интерфейса
   .clk50(clk50),          // тактовый сигнал 50МГц
   .reset(reset),           // сброс терминала

//   .vgaclk(VGA_CLK),
   .vga_blank(vga_blank)  // регистр видеосигнала -состояние теущего пикселя (0 - откл, 1 - вкл)

);



//---- BEGIN VGA

// assign TMDS[7] = vgar[1];
// assign TMDS[6] = vgar[0];
// assign TMDS[5] = vgag[1];
// assign TMDS[4] = vgag[0];
// assign TMDS[3] = vgab[1];
// assign TMDS[2] = vgab[0];
// assign TMDS[1] = vgav;
// assign TMDS[0] = vgah;

//---- END VGA


wire clock_dvi_s;
wire vga_blank;

//wire VGA_CLK;
reg VGA_CLK;
always @(posedge clk50) VGA_CLK <= ~VGA_CLK ;   


//BEGIN HDMI 1 NO SOUND (MULTICPM / Next186) 

hdmi hdmi_inst  (
    // clocks
    .CLK_PIXEL_I (VGA_CLK),
    .CLK_DVI_I   (clock_dvi_s),
    // components
    .R_I         ({8{vgared}}  ),
    .G_I         ({8{vgagreen}}),
    .B_I         ({8{vgablue}} ),
    .BLANK_I     (vga_blank    ),
    .HSYNC_I     (vgah  ),
    .VSYNC_I     (vgav  ),
    .TMDS_D0_O   (TMDS[3]),
    .TMDS_D1_O   (TMDS[5]),
    .TMDS_D2_O   (TMDS[7]),
    .TMDS_CLK_O  (TMDS[1])
);

assign TMDS[6] = 1'b0;
assign TMDS[4] = 1'b0;
assign TMDS[2] = 1'b0;
assign TMDS[0] = 1'b0;

// END HDMI 1 


endmodule