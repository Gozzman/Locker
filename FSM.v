`define  S0 4'd0
`define  S1 4'd1
`define  S2 4'd2
`define  S3 4'd3
`define 	S4 4'd4
`define	S5 4'd5
`define 	S6 4'd6

module FSM(
input CLK,
input RST,
input BTNA,
input BTNB,
input BTNC,
input BTND,
input BTNE,
input BTNF,
output reg [23:0]SEG,
output reg SUCESS_FLAG,
output reg WRONG_FLAG
);

reg [2:0]state;
reg [3:0]data [0:5];
reg [3:0]sucess_comb [0:5];

initial begin
	state = `S0;	
	sucess_comb[0] = 4'd1;
	sucess_comb[1] = 4'd2;
	sucess_comb[2] = 4'd3;
	sucess_comb[3] = 4'd4;
	sucess_comb[4] = 4'd5;
	sucess_comb[5] = 4'd6;
end

always@(posedge CLK)
begin
	if(RST) begin
		state <= `S0;
		for(i=0; i < 6; i = i + 1)
			data[i] <= 0;
		SUCESS_FLAG <= 0;
		WRONG_FLAG <= 0;
	end
	else begin 
		case(state)
		`S0:
			begin 
				if(BTNA) begin
					data[0] <= 4'd1;
					state <= `S1;
				end
				else if (BTNB) begin
					data[0] <= 4'd2;
					state <= `S1;
				end
				else if (BTNC) begin
					data[0] <= 4'd3;
					state <= `S1;
				end
				else if (BTND) begin
					data[0] <= 4'd4;
					state <= `S1;
				end
				else if (BTNE) begin
					data[0] <= 4'd5;
					state <= `S1;
				end
				else if (BTNF) begin
					data[0] <= 4'd6;
					state <= `S1;
				end
			end
			
		`S1:
			begin 
				if(BTNA) begin
					data[1] <= 4'd1;
					state <= `S2;
				end
				else if (BTNB) begin
					data[1] <= 4'd2;
					state <= `S2;
				end
				else if (BTNC) begin
					data[1] <= 4'd3;
					state <= `S2;
				end
				else if (BTND) begin
					data[1] <= 4'd4;
					state <= `S2;
				end
				else if (BTNE) begin
					data[1] <= 4'd5;
					state <= `S2;
				end
				else if (BTNF) begin
					data[1] <= 4'd6;
					state <= `S2;
				end
			end
			
		`S2:
			begin
				if(BTNA) begin
					data[2] <= 4'd1;
					state <= `S3;
				end
				else if (BTNB) begin
					data[2] <= 4'd2;
					state <= `S3;
				end
				else if (BTNC) begin
					data[2] <= 4'd3;
					state <= `S3;
				end
				else if (BTND) begin
					data[2] <= 4'd4;
					state <= `S3;
				end
				else if (BTNE) begin
					data[2] <= 4'd5;
					state <= `S3;
				end
				else if (BTNF) begin
					data[2] <= 4'd6;
					state <= `S3;
				end
			end
		`S3:
			begin
				if(BTNA) begin
					data[3] <= 4'd1;
					state <= `S4;
				end
				else if (BTNB) begin
					data[3] <= 4'd2;
					state <= `S4;
				end
				else if (BTNC) begin
					data[3] <= 4'd3;
					state <= `S4;
				end
				else if (BTND) begin
					data[3] <= 4'd4;
					state <= `S4;
				end
				else if (BTNE) begin
					data[3] <= 4'd5;
					state <= `S4;
				end
				else if (BTNF) begin
					data[3] <= 4'd6;
					state <= `S4;
				end
			end
		`S4:
			begin
				if(BTNA) begin
					data[4] <= 4'd1;
					state <= `S5;
				end
				else if (BTNB) begin
					data[4] <= 4'd2;
					state <= `S5;
				end
				else if (BTNC) begin
					data[4] <= 4'd3;
					state <= `S5;
				end
				else if (BTND) begin
					data[4] <= 4'd4;
					state <= `S5;
				end
				else if (BTNE) begin
					data[4] <= 4'd5;
					state <= `S5;
				end
				else if (BTNF) begin
					data[4] <= 4'd6;
					state <= `S5;
				end
			end
		`S5:
			begin 
				if(BTNA) begin
					data[5] <= 4'd1;
					state <= `S6;
				end
				else if (BTNB) begin
					data[5] <= 4'd2;
					state <= `S6;
				end
				else if (BTNC) begin
					data[5] <= 4'd3;
					state <= `S6;
				end
				else if (BTND) begin
					data[5] <= 4'd4;
					state <= `S6;
				end
				else if (BTNE) begin
					data[5] <= 4'd5;
					state <= `S6;
				end
				else if (BTNF) begin
					data[5] <= 4'd6;
					state <= `S6;
				end
			end
		`S6:
			begin
				if((data[0] == sucess_comb[0])&
				(data[1] == sucess_comb[1])&
				(data[2] == sucess_comb[2])&
				(data[3] == sucess_comb[3])&
				(data[4] == sucess_comb[4])&
				(data[5] == sucess_comb[5])) begin
					SUCESS_FLAG <= 1;
					WRONG_FLAG <= 0;
					state <= `S0;
				end
				else if((data[0] != sucess_comb[0])|
				(data[1] != sucess_comb[1])|
				(data[2] != sucess_comb[2])|
				(data[3] != sucess_comb[3])|
				(data[4] != sucess_comb[4])|
				(data[5] != sucess_comb[5])) begin
					WRONG_FLAG <= 1;
					SUCESS_FLAG <= 0;
					SEG[3:0] <= data[0];
					SEG[7:4] <= data[1];
					SEG[11:8] <= data[2];
					SEG[15:12] <= data[3];
					SEG[19:16] <= data[4];
					SEG[23:20] <= data[5];
					state <= `S0;
				end	
				else begin
					SUCESS_FLAG <= 0;
					WRONG_FLAG <= 0;
					state <= `S0;
				end
			end
		endcase
	end
end
endmodule 
