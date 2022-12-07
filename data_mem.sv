module data_mem(
	input clk,
	input Wen,
	input [5:0] memory_addfress,
	input [31:0] write_data,
	output reg [31:0] read_data
);

logic [7:0] Lika [64] = '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000,
			 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
								  
always_comb begin
	if(memory_addfress > 60) begin
		read_data = 0;
	end else read_data = {lika[memory_addfress], lika[memory_addfress + 1], lika[memory_addfress + 2], lika[memory_addfress + 3]};
end

always @(posedge clk) begin
	if (Wen && (memory_addfress <= 60)) begin
		lika[memory_addfress] = write_data[31:24];
		lika[memory_addfress + 1] = write_data[23:16];
		lika[memory_addfress + 2] = write_data[15:8];
		lika[memory_addfress + 3] = write_data[7:0];		
	end
end

endmodule