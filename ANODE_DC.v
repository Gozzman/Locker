module ANODE_DC(
input [2:0]ANODE_CNT,
output reg [5:0]ANODE
);


always@ *
begin
	case(ANODE_CNT)
		4'd0: ANODE = 6'b000001;
		4'd1: ANODE = 6'b000010;
		4'd2: ANODE = 6'b000100;
		4'd4: ANODE = 6'b001000;
		4'd3: ANODE = 6'b010000;
		4'd5: ANODE = 6'b100000;
		default: ANODE = 6'b000000;
	endcase
end

endmodule