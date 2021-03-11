//2020.9.28 按键消抖 示例应用
//学习自： https://www.stepfpga.com/doc/altera_7deb

module top (clk,rst,key,led);
 
        input             clk;
        input             rst;
        input 	          key;                      				
	output   reg      led;        
 
        wire              key_pulse;
 
        //当按键按下时产生一个高脉冲，翻转一次led
        always @(posedge clk  or  negedge rst)
           begin
             if (!rst) 
		led <= 1'b1;
	     else if (key_pulse)
		led <= ~led;
	     else
                led <= led;
	   end    
         //例化消抖module，这里没有传递参数N，采用了默认的N=1     
         debounce  u1 (                               
                       .clk (clk),
                       .rst (rst),
                       .key (key),
                       .key_pulse (key_pulse)
                       );
 endmodule
 