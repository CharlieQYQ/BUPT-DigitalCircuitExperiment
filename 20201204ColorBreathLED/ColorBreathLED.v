//2020.12.4 彩色呼吸灯

module ColorBreathLED(LEDr,LEDg,LEDb,CLK);
	
	input CLK;
	output LEDr,LEDg,LEDb;
	
	wire UP;
	wire DW;
	wire STT0;
	wire STT1;
	PWM up(CLK,1,STT0,UP);
	PWM dw(CLK,0,STT1,DW);
	
	reg[1:0]flag0=2'b00;
	always@(posedge STT0)
		if(flag0==2'b10)
			flag0<=1'b0;
		else
			flag0<=flag0+1'b1;
	assign LEDr=(flag0==2'b00)?UP:((flag0==2'b01)?DW:1'b1);

	reg[1:0]flag1=2'b01;
	always@(posedge STT0)
		if(flag1==2'b10)
			flag1<=1'b0;
		else
			flag1<=flag1+1'b1;
	assign LEDg=(flag1==2'b00)?UP:((flag1==2'b01)?DW:1'b1);

	reg[1:0]flag2=2'b10;
	always@(posedge STT0)
		if(flag2==2'b10)
			flag2<=1'b0;
		else
			flag2<=flag2+1'b1;
	assign LEDb=(flag2==2'b00)?UP:((flag2==2'b01)?DW:1'b1);
	
endmodule


module PWM(
				input CLK,
				input FLAG,//标志位,控制输出的PWM是升还是降(1升0降)
				output STT,//监视信号(脉冲)
				output PWM
				);

	reg[24:0]cnt1;
	reg[24:0]cnt2;

	parameter freq=2400;//控制PWM的周期

	reg stt;//监视状态
	always@(posedge CLK)
		if(cnt2==freq-1)//cnt2满,则状态为1(只持续一个时钟周期)
			stt<=1'b1;
		else
			stt<=1'b0;
	assign STT=stt;

	always@(posedge CLK)
		if(cnt1>=freq-1)//满则清零
			cnt1<=1'b0;
		else 
			cnt1<=cnt1+1'b1;

	always@(posedge CLK)
		if(cnt1==freq-1)//cnt1满,以cnt1从空到满为一个周期执行操作
			if(FLAG)//升的情况
				if(cnt2>=freq-1)
					cnt2<=1'b0;
				else
					cnt2<=cnt2+1'b1;//升
		else//降的情况
			if(cnt2<=0)
				cnt2<=freq-1;
			else 
				cnt2<=cnt2-1'b1;//降
		else
			cnt2<=cnt2;
	
	assign PWM=(cnt1<cnt2)?1'b0:1'b1;//PWM的核心,输出调制好的PWM信号

endmodule
