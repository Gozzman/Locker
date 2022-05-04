module MX(
    input  [23:0] IN,
    input  [2:0] ADDR,
    output reg [3:0] OUT
);

always @ (IN, ADDR)
begin
	case(ADDR)	
		4'd0: 	OUT = IN[3:0];
		4'd1: 	OUT = IN[7:4];
		4'd2: 	OUT = IN[11:8];
		4'd3: 	OUT = IN[15:12];
		4'd4: 	OUT = IN[19:16];
		4'd5: 	OUT = IN[23:20];
		default: OUT = 4'b0000;
	endcase
end

endmodule