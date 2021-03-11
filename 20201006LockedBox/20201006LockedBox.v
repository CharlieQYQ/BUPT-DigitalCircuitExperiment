//2020.10.6 密码箱

module LockedBox(Key1,Key2,Key3,Key4,LED,Button1,Button2,Seg_Led);
	//输入端口
	//四个拨杆开关 用于输入密码
	input Key1;
	input Key2;
	input Key3;
	input Key4;
	//两个按钮 用于确认两重密码正确性
	input Button1;
	input Button2;
	
	//输出端口 两个LED灯 代表打开与否 一个七段数码管 代表是否解锁
	output  [1:0] LED;
	output  [8:0] Seg_Led;
	
	//两个锁的状态变量，1代表锁定，0代表开启 数码管的状态变量
	reg Lock1;
	reg Lock2;
	reg [8:0] Seg_State;
	//初始赋值
	initial begin
		Lock1 = 1'b1;
		Lock2 = 1'b1;
		Seg_State = 9'h39;
	end
	
	//LED控制函数（同一变量不能在多个always中同时赋值）
	assign LED = {Lock1,Lock2};
	
	//数码管赋值函数
	assign Seg_Led = Seg_State;
	
	//检测函数1 检测第一次密码 LED1亮起(0)代表密码1正确
	always@(Button1)begin
		if(Button1 == 1'b0)begin
			if({Key1,Key2,Key3,Key4} == 4'b1010)begin	//1010密码1
				Lock1 = 1'b0;
			end
			else begin
				Lock1 = 1'b1;
			end
		end
	end
	
	//检测函数2 检测第二次密码 LED2亮起(0)代表密码2正确
	always@(Button2)begin
		if({Button2,Lock1} == 2'b00)begin
			if({Key1,Key2,Key3,Key4} == 4'b0101)begin	//0101密码2
				Lock2 = 1'b0;
			end
		end
		else begin
			Lock2 = 1'b1;
		end
	end
	
	//检测函数3 检测两个状态变量 如果都为0则开锁
	always@(Lock1,Lock2)begin
		if({Lock1,Lock2} == 2'b00)begin
			Seg_State = 9'h3f;	//显示0 代表Open 开启
		end
		else begin
			Seg_State = 9'h39;
		end
	end
	
endmodule

