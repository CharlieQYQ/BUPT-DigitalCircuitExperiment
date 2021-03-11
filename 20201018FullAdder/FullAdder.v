//2020.10.18 全加器
//

module FullAdder(Switch,Key,LED);
	//输入 两个四位二进制数
	input [3:0] Switch;
	input [3:0] Key;
	
	//输出 LED灯
	output reg [3:0] LED;
	
	reg Const0;
	//reg Const1;
	initial begin
		Const0 = 1'b0;
		//Const1 = 1'b1;
	end
	
	//进位标记
	reg Add1 [3:0];
	initial begin
		Add1[0] = 1'b0;
		Add1[1] = 1'b0;
		Add1[2] = 1'b0;
		Add1[3] = 1'b0;
	end
	
	//求和
	reg Sum [3:0];
	initial begin
		Sum[0] = 1'b0;
		Sum[1] = 1'b0;
		Sum[2] = 1'b0;
		Sum[3] = 1'b0;
	end
	
	//全加器函数
	function reg AddFunc;
		input Num1;
		input Num2;
		input Add1;
		
		begin
			AddFunc = 1'b0;
			AddFunc = Num1^Num2^Add1;
		end
	endfunction
	
	//进位函数
	function reg CountAdd;
		input Num1;
		input Num2;
		input Add1;
		
		begin
			CountAdd = 1'b0;
			CountAdd = (Num1&Num2)|(Num1&Add1)|(Num2&Add1);
		end
	endfunction
	
	//检测
	always@(Switch,Key)begin
	
		Add1[0] = CountAdd(Switch[0],Key[0],Const0);
		Add1[1] = CountAdd(Switch[1],Key[1],Add1[0]);
		Add1[2] = CountAdd(Switch[2],Key[2],Add1[1]);
		Add1[3] = CountAdd(Switch[3],Key[3],Add1[2]);
		
	end
	
	always@(Add1)begin
	
		Sum[0] = AddFunc(Switch[0],Key[0],Const0);
		//Sum[0] = AddFunc(Switch[0],Key[0],Add1[0]);
		Sum[1] = AddFunc(Switch[1],Key[1],Add1[0]);
		Sum[2] = AddFunc(Switch[2],Key[2],Add1[1]);
		Sum[3] = AddFunc(Switch[3],Key[3],Add1[2]);
		
		LED[0] = Sum[0];
		LED[1] = Sum[1];
		LED[2] = Sum[2];
		LED[3] = Sum[3];
		
	end
	
endmodule
