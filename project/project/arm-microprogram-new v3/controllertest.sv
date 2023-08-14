module ctrltest();
	logic         clk;
	logic         reset;
	logic [31:0]  Instr;
	logic [3:0]   ALUFlags;
	logic         PCWrite;
	logic         MemWrite;
	logic         RegWrite;
	logic         IRWrite;
	logic         AdrSrc;
	logic [1:0]   RegSrc;
	logic         ALUSrcA;
	logic [1:0]   ALUSrcB;
	logic [1:0]   ResultSrc;
	logic [1:0]   ImmSrc;
	logic [1:0]   ALUControl;

	controller ctrlr(clk, reset, Instr[31:12], ALUFlags, PCWrite, MemWrite, RegWrite, IRWrite, AdrSrc, RegSrc, ALUSrcA, ALUSrcB, ResultSrc, ImmSrc, ALUControl); 	 	

	// initialize test
	initial
	begin
		ALUFlags <= 0;
		Instr <= 'hE04F000F;
		reset <= 1; # 5; reset <= 0;
	end

	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
		

endmodule
