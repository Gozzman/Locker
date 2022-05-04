module Locker_Top(
input wire CLK,
input wire RST,
input wire BTNA,
input wire BTNB,
input wire BTNC,
input wire BTND,
input wire BTNE,
input wire BTNF,
output SUCESS_COMB_LED,
output WRONG_COMB_LED,
output [5:0]ANODE,
output [6:0]SEGMENTS
);

wire DIV_CLK;
wire [2:0]CNT;
wire [23:0]CATH_CHR;
wire MUX_OUT;

CLOCK_DIVIDER CLOCK_DIVIDER_WRAPPER(
.CLK(CLK),
.RST(RST),
.DIVIDED_CLK(DIV_CLK)
); 

FSM FSM_WRAPPER(
.CLK(CLK),
.RST(RST),
.BTNA(BTNA),
.BTNB(BTNB),
.BTNC(BTNC),
.BTND(BTND),
.BTNE(BTNE),
.BTNF(BTNF),
.SEG(CATH_CHR),
.SUCESS_FLAG(SUCESS_COMB_LED),
.WRONG_FLAG(WRONG_COMB_LED)
);

MX seg_mux(
.IN(CATH_CHR),
.ADDR(CNT),
.OUT(MUX_OUT)
);

ANODE_DC ANODE_DC_WRAPPER(
.ANODE_CNT(CNT),
.ANODE(ANODE)
);

ANODE_COUNTER ANODE_COUNTER_WRAPPER(
.CE(DIV_CLK),
.CLK(CLK),
.RST(RST),
.CNT(CNT)
);

wire o_seg_a; assign SEGMENTS[0] = ~o_seg_a;
wire o_seg_b; assign SEGMENTS[1] = ~o_seg_b;
wire o_seg_c; assign SEGMENTS[2] = ~o_seg_c;
wire o_seg_d; assign SEGMENTS[3] = ~o_seg_d;
wire o_seg_e; assign SEGMENTS[4] = ~o_seg_e;
wire o_seg_f; assign SEGMENTS[5] = ~o_seg_f;
wire o_seg_g; assign SEGMENTS[6] = ~o_seg_g;

CATHODE_DC CATHODE_DC_WRAPPER(
.I_CODE(MUX_OUT),
.O_SEG_A(o_seg_a),
.O_SEG_B(o_seg_b),
.O_SEG_C(o_seg_c),
.O_SEG_D(o_seg_d),
.O_SEG_E(o_seg_e),
.O_SEG_F(o_seg_f),
.O_SEG_G(o_seg_g)
);



endmodule