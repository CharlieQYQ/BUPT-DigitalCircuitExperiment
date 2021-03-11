`timescale 1ns/1ns
module Cnt8421_vlg_tst;
	reg CK=0,RST=1;
	wire[3:0]Q;
	Cnt8421 UUT(CK,RST,Q);
	initial#1 RST=0;
	always#1 CK<=~CK;
endmodule
