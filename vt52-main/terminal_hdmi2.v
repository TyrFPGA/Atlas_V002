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
//  .c1(clock_dvi_s),    //125 MHz
  .locked (pll_locked)
);

wire   vgah;         // строчный синхросигнал
wire   vgav;         // кадровый синхросигнал
wire   [1:0] vgar;   // шина DAC красного видеосигнала
wire   [1:0] vgag;   // шина DAC зеленого видеосигнала
wire   [1:0] vgab;   // шина DAC синего видеосигнала

// assign TMDS[7] = vgar[1];
// assign TMDS[6] = vgar[0];
// assign TMDS[5] = vgag[1];
// assign TMDS[4] = vgag[0];
// assign TMDS[3] = vgab[1];
// assign TMDS[2] = vgab[0];
// assign TMDS[1] = vgav;
// assign TMDS[0] = vgah;


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

wire terminal_tx;
wire terminal_rx;

wire sound;         // управление звуковым сигналом

wire autoreset;     // автоматически генерируемый сброс
reg [5:0]resetcnt;  // счетчик задержки формирователя сброса

assign reset=~resetbtn | autoreset;  // сброс от кнопки и стартового таймера
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
   .vga_out(vga_out)  // регистр видеосигнала -состояние теущего пикселя (0 - откл, 1 - вкл)

);

wire vga_out;
wire clock_dvi_s;
wire vga_blank;

assign vga_blank = ~vga_out;

wire VGA_CLK;
// reg VGA_CLK;
// always @(posedge clk50) VGA_CLK <= ~VGA_CLK ;   

pll2 PLL2_inst(
     .inclk0(clk12),
     .c0(VGA_CLK),       // 25 MHz
     .c1(clock_dvi_s)    //125 MHz
 );   



// //BEGIN HDMI 1 NO SOUND (MULTICPM / Next186) 
// assign TMDS[6] = 1'b0;
// assign TMDS[4] = 1'b0;
// assign TMDS[2] = 1'b0;
// assign TMDS[0] = 1'b0;

// hdmi hdmi_inst  (
//     // clocks
//     .CLK_PIXEL_I (VGA_CLK),
//     .CLK_DVI_I   (clock_dvi_s),
//     // components
//     .R_I         ({8{vgared}}  ),
//     .G_I         ({8{vgagreen}}),
//     .B_I         ({8{vgablue}} ),
//     .BLANK_I     (vga_blank    ),
//     .HSYNC_I     (vgah  ),
//     .VSYNC_I     (vgav  ),
//     .TMDS_D0_O   (TMDS[3]),
//     .TMDS_D1_O   (TMDS[5]),
//     .TMDS_D2_O   (TMDS[7]),
//     .TMDS_CLK_O  (TMDS[1])
// );
// // END HDMI 1 


//----  BEGIN HDMI 2 (MSX)  

hdmi 
#(
   .FREQ	(25000000),	//-- pixel clock frequency 
   .CTS	(25000),	   //-- CTS = Freq(pixclk) * N / (128 * Fs)
   .FS	(48000),		//-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
   .N	   (6144)  		//-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
) 
hdmi_inst
(
   .I_CLK_PIXEL(VGA_CLK),
   .I_R			({8{vgared}}),
   .I_G			({8{vgagreen}}),
   .I_B			({8{vgablue}}),
   .I_BLANK		(vga_blank),
   .I_HSYNC		(vgah),
   .I_VSYNC		(vgav),
   //-- PCM audio
   .I_AUDIO_ENABLE	(1'b0),
   // .I_AUDIO_PCM_L 	(sound_hdmi_l_s),
   // .I_AUDIO_PCM_R	   (sound_hdmi_r_s),
   //-- TMDS parallel pixel synchronous outputs (serialize LSB first)
   .O_RED		(tdms_r_s),
   .O_GREEN		(tdms_g_s),
   .O_BLUE		(tdms_b_s) 
);

wire [9:0] tdms_r_s, tdms_g_s, tdms_b_s;
wire [3:0] tdms_p_s;
wire [3:0] tdms_n_s;

hdmi_out_altera hdmio   (
   .clock_pixel_i (VGA_CLK),
   .clock_tdms_i	(clock_dvi_s),
   .red_i			(tdms_r_s),	 
   .green_i			(tdms_g_s),	 
   .blue_i			(tdms_b_s),	 
   .tmds_out_p		(tdms_p_s),	 
   .tmds_out_n		(tdms_n_s)	 
);

assign TMDS[7]	= tdms_p_s[2];	//-- 2+		
assign TMDS[6]	= tdms_n_s[2];	//-- 2-		
assign TMDS[5]	= tdms_p_s[1];	//-- 1+			
assign TMDS[4]	= tdms_n_s[1];	//-- 1-		
assign TMDS[3]	= tdms_p_s[0];	//-- 0+		
assign TMDS[2]	= tdms_n_s[0];	//-- 0-	
assign TMDS[1]	= tdms_p_s[3];	//-- CLK+	
assign TMDS[0]	= tdms_n_s[3];	//-- CLK-

//---- END HDMI 2 



endmodule