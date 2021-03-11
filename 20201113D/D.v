//2020.11.13
//上升沿D触发器 带同步复位

module D(D,Reset,LED,Clock);
	input D;
	input Reset;
	input Clock;
	
	output reg LED;
	
	always@(posedge Clock) begin
		if(Reset == 1'b0) begin
			LED <= 1'b1;
		end
		else begin
			LED <= D;
		end
	end
	
endmodule
