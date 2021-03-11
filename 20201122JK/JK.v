//2020.11.22 下降沿触发JK触发器

module JK(CLK,J,K,Rst,Set,LED);
	input CLK;
	input J;
	input K;
	input Rst;
	input Set;
	
	output reg LED;
	
	initial begin
		LED = 1'b1;
	end
	

	always@(negedge CLK) begin
		if(Set == 1'b1 && Rst == 1'b1)
			LED <= J & (~LED) || ~K & LED; 
		else
			LED <= Set || ~Rst;
	end
	
endmodule
