module seqlogic(input logic clk, reset, input logic [1:0] Op, input logic [5:0] Funct,
		input logic [3:0] nextAdr, output logic [3:0] adr);

    always_ff@(posedge clk, posedge reset)
		if(reset) 
			adr <= 4'b0000;
		else
			casex ({nextAdr, Op , Funct[5], Funct[0]})
				8'b111101??: adr <= 4'b0010;
				8'b111110??: adr <= 4'b1001;
				8'b1111000?: adr <= 4'b0110;
				8'b1111001?: adr <= 4'b0111;
				8'b1110???1: adr <= 4'b0011;
				8'b1110???0: adr <= 4'b0100;
				default:     adr <= nextAdr;
			endcase
endmodule
