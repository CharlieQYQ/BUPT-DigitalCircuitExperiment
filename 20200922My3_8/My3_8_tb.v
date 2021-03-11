`timescale 1ns/1ns

module My3_8_tb;
	
	//激励信号
	//reg输入
	reg a;
	reg b;
	reg c;
	//wire输出
	wire [7:0]out;
	
	//测试单元
	My3_8 u1(
		.A(a),
		.B(b),
		.C(c),
		.OUT(out)
	);
	
	initial begin
		
		a = 0;
		b = 0;
		c = 0;
		#200;
		a = 0;
		b = 0;
		c = 1;
		#200;
		a = 0;
		b = 1;
		c = 0;
		#200;
		a = 0;
		b = 1;
		c = 1;
		#200;
		a = 1;
		b = 0;
		c = 0;
		#200;
		a = 1;
		b = 0;
		c = 1;
		#200;
		a = 1;
		b = 1;
		c = 0;
		#200;
		a = 1;
		b = 1;
		c = 1;
		#200;
		$stop;
		
	end
	
	
endmodule
