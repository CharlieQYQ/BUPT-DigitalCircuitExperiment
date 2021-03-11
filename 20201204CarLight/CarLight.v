//2020.12.4 汽车尾灯

module CarLight(CLK,LEDl,LEDr,Switch);
	//输入信号
	input CLK;
	input [3:0] Switch;
	
	//输出信号 两个RGBLED
	output [2:0] LEDl;
	output [2:0] LEDr;
	
	//中间变量
	reg [2:0] LEDL,LEDR;
	
	//连续赋值
	assign LEDl = LEDL;
	assign LEDr = LEDR;
	
	//计时器和标记信号
	reg [30:0] Time;
	reg One;
	
	//初始化
	initial begin
		Time = 1'b0;
		One = 1'b0;
	end
	
	//1s计时
	always@(posedge CLK) begin
		if(Time == 24'h5b8d80) begin	//0.5s翻转
			Time <= 1'b0;
			One <= ~One;
		end
		else begin
			Time <= Time + 1'b1;
		end
	end
	
	always@(One) begin
	if(One == 1'b1) begin
		if(Switch == 4'b1000) begin
			LEDL = 3'b001;
			LEDR = 3'b111;
		end
		else if(Switch == 4'b0001) begin
			LEDL = 3'b111;
			LEDR = 3'b001;
		end
		else if(Switch == 4'b0100 || Switch ==4'b0010) begin
			LEDL = 3'b001;
			LEDR = 3'b001;
		end
		else begin
			LEDL = 3'b111;
			LEDR = 3'b111;
		end
	end
	else begin
		LEDL = 3'b111;
		LEDR = 3'b111;
	end
	end
	
endmodule
