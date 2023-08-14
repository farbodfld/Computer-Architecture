module datapath(input  logic        clk, reset,
                output logic [31:0] Adr, WriteData,
                input  logic [31:0] ReadData,
                output logic [31:0] Instr,
                output logic [3:0]  ALUFlags,
                input  logic        PCWrite, RegWrite,
                input  logic        IRWrite,
                input  logic        AdrSrc, 
                input  logic [1:0]  RegSrc, 
					 input  logic        ALUSrcA,
                input  logic [1:0]  ALUSrcB, ResultSrc,
                input  logic [1:0]  ImmSrc, ALUControl);

  	logic [31:0] PCNext, PC;
  	logic [31:0] ExtImm, SrcA, SrcB, Result;
  	logic [31:0] Data, RD1, RD2, A, ALUResult, ALUOut;
  	logic [3:0]  RA1, RA2;

	// Your datapath hardware goes below. Instantiate each of the 
  	// submodules that you need. Remember that you can reuse hardware
  	// from the book. Be sure to give your instantiated modules 
  	// applicable names such as pcreg (PC register), adrmux 
  	// (Address Mux), etc. so that your code is easier to understand.


	// generating Adr which goes out of dp
	flopenr #(32) pr(clk, reset, PCWrite, Result, PC);
	mux2 #(32) adrmux(PC, Result, AdrSrc, Adr);

	flopenr #(32) instrreg(clk, reset, IRWrite, ReadData, Instr);
	flopr #(32) datareg(clk, reset, ReadData, Data);

	// register file part
	mux2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
	mux2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);
	regfile rf(clk, RegWrite, RA1, RA2, Instr[15:12], Result, Result, RD1, RD2);
	
	// extension immediate
	extend extimm(Instr[23:0], ImmSrc, ExtImm);
	
	// logic for A and WriteData
	flopr #(32) areg(clk, reset, RD1, A);
	logic [31:0] Temp;
	flopr #(32) readdatareg(clk, reset, RD2, Temp);
	shifter sh(Temp, Instr[11:7], Instr[6:5], WriteData);
	
	// ALU logic
	mux2 #(32) aluSrca(A, PC, ALUSrcA, SrcA);
	mux3 #(32) aluSrcb(WriteData, ExtImm, 4, ALUSrcB, SrcB);
	alu alu(SrcA, SrcB, ALUControl, ALUResult, ALUFlags);
	
	// ALU out buffer
	flopr #(32) aluoutreg(clk, reset, ALUResult, ALUOut);
	
	// result mux
	mux3 #(32) aluoutmux(ALUOut, Data, ALUResult, ResultSrc, Result);

endmodule
