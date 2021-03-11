//2020.9.28 按键消抖 无消抖版
//学习自： https://www.stepfpga.com/doc/altera_7deb

module top(
		key,          //按键输入
		rst,          //复位输入
		led           //led输出
		);
 
	input key,rst;
	output reg led;
 
	always @(key or rst)
		if (!rst)             //复位时led熄灭
			led = 1;
		else if(key == 0)     
			led = ~led;   //按键按下时led翻转
		else
			led = led;
endmodule
