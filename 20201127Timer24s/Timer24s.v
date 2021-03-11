//2020.11.27 24s计时器

module Timer24s(CLK,Reset,Seg1,Seg2);
	input CLK;
	input Reset;
	
	output wire [8:0] Seg1,Seg2;
	
	reg [8:0] seg1,seg2;
	
	assign Seg1 = seg1;
	assign Seg2 = seg2;
	
	wire [8:0] SegState[9:0];
	initial begin
		SegState[0] = 9'h3f;                                           //对存储器中第一个数赋值9'b00_0011_1111,相当于共阴极接地，DP点变低不亮，7段显示数字  0
	   SegState[1] = 9'h06;                                           //7段显示数字  1
	   SegState[2] = 9'h5b;                                           //7段显示数字  2
	   SegState[3] = 9'h4f;                                           //7段显示数字  3
	   SegState[4] = 9'h66;                                           //7段显示数字  4
	   SegState[5] = 9'h6d;                                           //7段显示数字  5
	   SegState[6] = 9'h7d;                                           //7段显示数字  6
	   SegState[7] = 9'h07;                                           //7段显示数字  7
	   SegState[8] = 9'h7f;                                           //7段显示数字  8
	   SegState[9] = 9'h6f; 
	end
	
	reg [25:0] Counter;
	reg [5:0] Time;
	
	always@(posedge CLK) begin
		
		if(Reset == 1'b0) begin
			Time <= 5'b11000;
			Counter <= 1'b0;
		end
		
		else if(Counter == 24'hb71b00) begin
			Counter = 24'b0;
			if(Time == 5'b0) begin
				Time = 5'b11000;
			end
			else begin
				Time = Time - 1'b1;
			end
		end
		else begin
			Counter = Counter + 1'b1;
		end
	end
	
	always@(Time) begin
		case(Time)
			5'b11000 : begin seg1 = SegState[2]; seg2 = SegState[4]; end
			5'b10111 : begin seg1 = SegState[2]; seg2 = SegState[3]; end
			5'b10110 : begin seg1 = SegState[2]; seg2 = SegState[2]; end
			5'b10101 : begin seg1 = SegState[2]; seg2 = SegState[1]; end
			5'b10100 : begin seg1 = SegState[2]; seg2 = SegState[0]; end
			5'b10011 : begin seg1 = SegState[1]; seg2 = SegState[9]; end
			5'b10010 : begin seg1 = SegState[1]; seg2 = SegState[8]; end
			5'b10001 : begin seg1 = SegState[1]; seg2 = SegState[7]; end
			5'b10000 : begin seg1 = SegState[1]; seg2 = SegState[6]; end
			5'b01111 : begin seg1 = SegState[1]; seg2 = SegState[5]; end
			5'b01110 : begin seg1 = SegState[1]; seg2 = SegState[4]; end
			5'b01101 : begin seg1 = SegState[1]; seg2 = SegState[3]; end
			5'b01100 : begin seg1 = SegState[1]; seg2 = SegState[2]; end
			5'b01011 : begin seg1 = SegState[1]; seg2 = SegState[1]; end
			5'b01010 : begin seg1 = SegState[1]; seg2 = SegState[0]; end
			5'b01001 : begin seg1 = SegState[0]; seg2 = SegState[9]; end
			5'b01000 : begin seg1 = SegState[0]; seg2 = SegState[8]; end
			5'b00111 : begin seg1 = SegState[0]; seg2 = SegState[7]; end
			5'b00110 : begin seg1 = SegState[0]; seg2 = SegState[6]; end
			5'b00101 : begin seg1 = SegState[0]; seg2 = SegState[5]; end
			5'b00100 : begin seg1 = SegState[0]; seg2 = SegState[4]; end
			5'b00011 : begin seg1 = SegState[0]; seg2 = SegState[3]; end
			5'b00010 : begin seg1 = SegState[0]; seg2 = SegState[2]; end
			5'b00001 : begin seg1 = SegState[0]; seg2 = SegState[1]; end
			5'b00000 : begin seg1 = SegState[0]; seg2 = SegState[0]; end
		endcase
	end
	
	
endmodule
