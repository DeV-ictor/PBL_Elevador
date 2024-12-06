module decoder_3to7seg (
    input [2:0] binary_in,  // Entrada binária de 3 bits
    output reg [6:0] seg    // Saídas para os segmentos a-g do display
);

	always @ (binary_in) begin

		 case (binary_in)
		 
			  3'b000: seg = 7'b0000001; // 0
			  
			  3'b001: seg = 7'b1001111; // 1
			  
			  3'b010: seg = 7'b0010010; // 2
			  
			  3'b011: seg = 7'b0000110; // 3
			  
			  3'b100: seg = 7'b1001100; // 4
			  
			  3'b101: seg = 7'b0100100; // 5
			  
			  3'b110: seg = 7'b0100000; // 6
			  
			  3'b111: seg = 7'b0001111; // 7
			  
			  default: seg = 7'b0000001; // carga maxima
			  
		 endcase
		 
	end

endmodule