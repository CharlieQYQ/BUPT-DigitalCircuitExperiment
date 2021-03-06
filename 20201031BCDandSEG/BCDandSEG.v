//2019.10.31 8421BCD和数位管

module BCDandSEG(Switch,SEG);
	//输入端口
	input [3:0] Switch;
	
	//输出端口
	output [8:0] SEG;
	
	reg [8:0] SEGLED;
	
	always@(Switch)begin
		case(Switch)
			4'b0000: SEGLED = 9'h3f;
			4'b0001: SEGLED = 9'h06;
			4'b0010: SEGLED = 9'h5b;
			4'b0011: SEGLED = 9'h4f;
			4'b0100: SEGLED = 9'h66;
			4'b0101: SEGLED = 9'h6d;
			4'b0110: SEGLED = 9'h7d;
			4'b0111: SEGLED = 9'h07;
			4'b1000: SEGLED = 9'h7f;
			4'b1001: SEGLED = 9'h6f;
			default: SEGLED = 9'h3f;
		endcase
	end
	
	assign SEG = SEGLED;
	
endmodule
