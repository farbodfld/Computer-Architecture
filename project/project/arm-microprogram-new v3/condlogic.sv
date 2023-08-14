module condlogic(input  logic       clk, reset,
                 input  logic [3:0] Cond,
                 input  logic [3:0] ALUFlags,
                 input  logic [1:0] FlagW,
                 input  logic       PCS, NextPC, RegW, MemW,
                 output logic       PCWrite, RegWrite, MemWrite);

	logic [1:0] FlagWrite;
	logic [3:0] Flags;
	logic       CondEx, CondExNew;
	
	flopr #(1) condexreg(clk, reset, CondEx, CondExNew);
	
	flopenr #(2)flagreg1(clk, reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);
	flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

	condcheck cc(Cond, Flags, CondEx);
	assign FlagWrite = FlagW & {2{CondEx}};
	assign PCWrite = (PCS & CondExNew) | NextPC;
	assign RegWrite = RegW & CondExNew;
	assign MemWrite = MemW & CondExNew;

endmodule
