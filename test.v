module test;
reg CLK;
reg RST;
reg BTNA;
reg BTNB;
reg BTNC;
reg BTND;
reg BTNE;
reg BTNF;
wire SUCESS_COMB_LED;
wire WRONG_COMB_LED;
wire [5:0]ANODE;
wire [6:0]SEGMENTS;

Locker_Top UUT(
.CLK(CLK),
.RST(RST),
.BTNA(BTNA),
.BTNB(BTNB),
.BTNC(BTNC),
.BTND(BTND),
.BTNE(BTNE),
.BTNF(BTNF),
.SUCESS_COMB_LED(SUCESS_COMB_LED),
.WRONG_COMB_LED(WRONG_COMB_LED),
.ANODE(ANODE),
.SEGMENTS(SEGMENTS)
);
always
	#5 CLK = ~CLK;

initial begin
	CLK = 1'b0;
	RST = 1'b1;
	#20;
	
	RST = 1'b0;
	BTNA = 1'b1;
	#10
	BTNA = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNB = 1'b1;
	#10
	BTNB = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNC = 1'b1;
	#10
	BTNC = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTND = 1'b1;
	#10
	BTND = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNE = 1'b1;
	#10
	BTNE = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNF = 1'b1;
	#10
	BTNF = 1'b0;
	
	#20
	
	RST = 1'b1;
	#20
	
	//wrong comb
	
	RST = 1'b0;
	BTNA = 1'b1;
	#10
	BTNA = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNA = 1'b1;
	#10
	BTNA = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNC = 1'b1;
	#10
	BTNC = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTND = 1'b1;
	#10
	BTND = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNE = 1'b1;
	#10
	BTNE = 1'b0;
	
	#10
	
	RST = 1'b0;
	BTNF = 1'b1;
	#10
	BTNF = 1'b0;
	
	#20;

end

endmodule
	
	