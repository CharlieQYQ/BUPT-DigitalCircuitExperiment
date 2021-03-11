//2020.11.22 74HC595

module My74HC595(CLK,Key,LED);
	input CLK;
	input [1:0] Key;
	
	output wire [7:0] LED;
	
	wire [1:0] KeyState;
	reg Rst;
	reg [7:0] LEDState;
	
	initial begin
		Rst = 1'b1;
		LEDState = 8'b00000000;
	end
	/*
	assign KeyState = Key;
	*/
	assign LED = LEDState;
	
	debounce m1(CLK,Rst,Key,KeyState);
	
	
	
	always@(KeyState) begin
		if(KeyState == 2'b01) begin
			LEDState = LEDState << 1;
			LEDState = LEDState + 1'b1;
		end
		else if(KeyState == 2'b10) begin
			LEDState = LEDState << 1;
			LEDState = LEDState + 1'b0;
		end
	end
	
	
endmodule
