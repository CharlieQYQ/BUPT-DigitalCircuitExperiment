//2020.11.27 JK触发器实现8421BCD计数器

module JKfor8421BCD(CLK,Reset,Q);
	input CLK;
	input Reset;
	
	output [3:0] Q;
	
	JK m1(CLK,Reset,1,1,Q[0]);
	JK m2(Q[0],Reset,~Q[3],~Q[3],Q[1]);
	JK m3(Q[1],Reset,1,1,Q[2]);
	JK m4(Q[0],Reset,Q[1]&Q[2],Q[3],Q[3]);
	
endmodule

module JK(CLK,Reset,J,K,Q);
	input CLK;
	input Reset;
	input J;
	input K;
	
	output reg Q;
	
	always@(negedge CLK) begin
		if(Reset)
			Q <= 0;
		else
			case({J,K})
				2'b00 : Q <= Q;
				2'b01 : Q <= 1'b0;
				2'b10 : Q <= 1'b1;
				default : Q <= ~Q;
			endcase
	end
endmodule
