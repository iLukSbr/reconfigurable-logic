module SEG7_LUT	(	oSEG,iDIG	);
input	[3:0]	iDIG;
output	[6:0]	oSEG;
reg		[6:0]	oSEG;

always @(iDIG)
begin
		case(iDIG)
		// Digits 0-9
		4'h0: oSEG = 7'b1000000;
		4'h1: oSEG = 7'b1111001;
		4'h2: oSEG = 7'b0100100;
		4'h3: oSEG = 7'b0110000;
		4'h4: oSEG = 7'b0011001;
		4'h5: oSEG = 7'b0010010;
		4'h6: oSEG = 7'b0000010;
		4'h7: oSEG = 7'b1111000;
		4'h8: oSEG = 7'b0000000;
		4'h9: oSEG = 7'b0011000;
		// Hex Chars A & B
		4'ha: oSEG = 7'b0001000;
		4'hb: oSEG = 7'b0000011;
		// Custom Patterns
		4'hc: oSEG = 7'b1111111; // Blank
		4'hd: oSEG = 7'b1111110; // Upper Line
		4'he: oSEG = 7'b0111111; // Middle Line
		4'hf: oSEG = 7'b1110111; // Lower Line
		default: oSEG = 7'b1111111; // Default to Blank
		endcase
end

endmodule
