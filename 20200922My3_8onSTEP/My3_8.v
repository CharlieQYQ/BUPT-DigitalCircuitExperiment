module My3_8(a,b,c,out);
	
	input a;
	input b;
	input c;
	
	output reg [8:0]out;
	
	always@(a,b,c)begin
		case({a,b,c})
			3'b000:out=9'h3f;
			3'b001:out=9'h06;
			3'b011:out=9'h5b;
			3'b010:out=9'h4f;
			3'b110:out=9'h66;
			3'b100:out=9'h6d;
			3'b101:out=9'h7d;
			3'b111:out=9'h07;
		endcase
	end
	
	
	
endmodule
