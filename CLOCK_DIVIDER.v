module CLOCK_DIVIDER
#(
parameter DIV_VALUE = 1000,
parameter WIDTH = 10
)
(
input CLK,
input RST,
output reg DIVIDED_CLK = 0
);

reg [WIDTH-1:0]counter; 

always@(posedge CLK)
begin
	if(RST) begin
		counter <= 0;
		DIVIDED_CLK <= 0;
		end
	else if (counter == (DIV_VALUE-1)) begin
		DIVIDED_CLK <= 1;
		counter <= 0;
		end
	else begin
		counter <= counter + 1;
		DIVIDED_CLK <= 0;
		end	
end



endmodule
