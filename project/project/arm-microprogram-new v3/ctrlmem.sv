module ctrlmem(input logic [3:0] adr, output logic [15:0] controlWord);

	always_comb
		case(adr)
			4'b0000: controlWord = 16'b1001010110000001; // Fetch   	  
			4'b0001: controlWord = 16'b0000010110001111; // Decode  	
			4'b0010: controlWord = 16'b00000xx001001110; // MemAdr  	
			4'b0011: controlWord = 16'b0000100xxx0x0101; // MemRead 	
			4'b0100: controlWord = 16'b0010100xxx0x0000; // MemWrite	
			4'b0101: controlWord = 16'b0100001xxx0x0000; // MemWB   	
			4'b0110: controlWord = 16'b00000xx000011000; // ExecuteR	
			4'b0111: controlWord = 16'b00000xx001011000; // ExecuteI	
			4'b1000: controlWord = 16'b0100000xxx0x0000; // ALUWB   	
			4'b1001: controlWord = 16'b0000010001100000; // Branch  	
			default: controlWord = 16'bxxxxxxxxxxxxxxxx; // Default 	
		endcase

endmodule
