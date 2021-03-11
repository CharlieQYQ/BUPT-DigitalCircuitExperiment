//2020.11.13
//带清零功能计数器

module Counter(LED,Key,Reset,CLK);
	input Key;
	input Reset;
	input CLK;
	
	output [7:0] LED;
	
	reg [7:0] led;
	
	wire KeyState;
	
	debounce m1(CLK,Reset,Key,KeyState);
	
	assign LED = led;
	
	always@(negedge KeyState or negedge Reset) begin
		if(Reset == 1'b0) begin
			led = 8'b11111111;
		end
		else begin
			if(KeyState == 1'b0) begin
				led = led - 1'b1;
			end
		end
	end
endmodule
