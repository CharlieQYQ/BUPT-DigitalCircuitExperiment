//2020.9.22 3-8译码器
//学习自:https://www.bilibili.com/video/BV1KE411h7AZ?p=2

module My3_8(A,B,C,OUT);
	
	//定义端口类型
	input A;		//输入端口A
	input B;		//输入端口B
	input C;		//输入端口C
	
	output reg [7:0]OUT;		//输出端口OUT，用于always语句中需为reg型
	
	//逻辑设计
	always@(A,B,C)begin
		case({A,B,C})
			3'b000:OUT = 8'b0000_0001;
			3'b001:OUT = 8'b0000_0010;
			3'b010:OUT = 8'b0000_0100;
			3'b011:OUT = 8'b0000_1000;
			3'b100:OUT = 8'b0001_0000;
			3'b101:OUT = 8'b0010_0000;
			3'b110:OUT = 8'b0100_0000;
			3'b111:OUT = 8'b1000_0000;
			//default:OUT = 8'b0000_0001;
		endcase
	end
	
endmodule
