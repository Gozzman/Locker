module ANODE_COUNTER(
    input CE,
    input CLK,
    input RST,
    output reg [2:0]CNT
);

always @ (posedge CLK)
begin
	if(RST) 
		CNT <= 0;
	else if(CE) 
		CNT <= CNT + 1'b1;
	else if (CNT == 3'b110)
		CNT <= 0;
end

endmodule