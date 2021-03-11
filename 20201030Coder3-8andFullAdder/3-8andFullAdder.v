//2019.10.31 3-8译码器&全加器

module Decoder3_8andFullAdder(Sw1,Sw2,Sw3,Sa,LED);
	//输入端口
	input Sw1;
	input Sw2;
	input Sw3;
	input Sa;
	
	
	//输出端口
	//LED[1] 代表这一位求和 LED[0]代表这一位给上一位进位
	output [1:0] LED;
	
	reg [1:0] LEDi;
	reg [3:0] Sw;
	
	//3-8译码器
	always@(Sw1,Sw2,Sw3,Sa)begin
		Sw = {Sw1,Sw2,Sw3};
		if(Sa == 1'b1)
			case(Sw)
				3'b000: LEDi = ~2'b00;
				3'b001: LEDi = ~2'b10;
				3'b010: LEDi = ~2'b10;
				3'b011: LEDi = ~2'b01;
				3'b100: LEDi = ~2'b10;
				3'b101: LEDi = ~2'b01;
				3'b110: LEDi = ~2'b01;
				3'b111: LEDi = ~2'b11;
				default: LEDi = ~2'b00;
			endcase
		else
			LEDi = 2'b00;
		
	end
	
	assign LED = LEDi;
	
	
	/*
	//输出端口
	output [7:0] LED;
	
	reg [7:0] LEDi;
	reg [3:0] Sw;
	
	//3-8译码器
	always@(Sw1,Sw2,Sw3,Sa)begin
		Sw = {Sw1,Sw2,Sw3};
		if(Sa == 1'b1)
			case(Sw)
				3'b000: LEDi = ~8'b00000001;
				3'b001: LEDi = ~8'b00000010;
				3'b010: LEDi = ~8'b00000100;
				3'b011: LEDi = ~8'b00001000;
				3'b100: LEDi = ~8'b00010000;
				3'b101: LEDi = ~8'b00100000;
				3'b110: LEDi = ~8'b01000000;
				3'b111: LEDi = ~8'b10000000;
				default: LEDi = ~8'b00000000;
			endcase
		else
			LEDi = 8'b11111111;
		
	end
	
	assign LED = LEDi;
	*/
	
endmodule
