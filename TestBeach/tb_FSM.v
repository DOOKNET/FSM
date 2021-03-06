`timescale	1ns/1ps
module tb_FSM();

reg 	sclk;
reg	rst_n;
reg	din;
wire 	dout;

//--------设置系统时钟和复位--------//
initial	begin
	sclk = 1;
	rst_n = 0;
	#50
	rst_n = 1;
end
always	#10	sclk = ~sclk;
//--------------------------------//

//-----------输入信号-------------//
initial	begin
	din = 1;
	#100
	din = 0;
	#20
	din = 0;
	#20
	din = 1;
	#20
	din = 0;
	#20
	din = 1;
	#20
	din = 0;
	#20
	din = 1;
	#20
	din = 0;
	#20
	din = 0;
	#20
	din = 0;
	#20
	din = 1;
	#20
	din = 0;
	#20
	din = 1;
	#20
	din = 1;
	#20
	din = 1;
	#20
	din = 0;
	#20
	din = 0;
end
//---------------------------------//

//-------------例化模块-------------//
FSM_book			FSM_inst0(
	.clk	(sclk),
	.rst_n	(rst_n),
	.din	(din),
	.dout	(dout)
);

endmodule

