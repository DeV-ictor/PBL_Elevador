module engine_counter (
  input  wire clk, reset,
  input  wire [1:0] dir, // Sinal de direção (01 para decréscimo, 10 para acréscimo)
  output wire [3:0] count, // Saída do contador
  output R0, R1, R2, R3, R4, R5, R6, C0, C1, C2, C3, C4
);

  reg [3:0] count_reg; // Registrador para armazenar o valor do contador

  always @(posedge clk or posedge reset) begin
  
	 if (reset) begin
	 
		 count_reg <= 3'b000;
		
	 end else begin
  
		 if (dir == 2'b10) begin
		 
			 if (count_reg == 3'b110)
			 
					count_reg <= 3'b000;
					
			 else
		 
					count_reg <= count_reg + 1; // Aumenta o contador
			
		 end else if (dir == 2'b01) begin
		 
			 if (count_reg == 3'b000)
			 
				  count_reg <= 3'b110;
				  
			 else
		 
				  count_reg <= count_reg - 1; // Diminui o contador
			
		 end else
			
			 count_reg <= count_reg;
			 
	  end
	 
  end

  assign count = count_reg; // Atribui o valor do registrador à saída
  
  assign R0 = (count == 3'b000) ? 1'b0 : 1'b1;
  assign R1 = (count == 3'b001) ? 1'b0 : 1'b1;
  assign R2 = (count == 3'b010) ? 1'b0 : 1'b1;
  assign R3 = (count == 3'b011) ? 1'b0 : 1'b1;
  assign R4 = (count == 3'b100) ? 1'b0 : 1'b1;
  assign R5 = (count == 3'b101) ? 1'b0 : 1'b1;
  assign R6 = (count == 3'b110) ? 1'b0 : 1'b1;
  
  assign C0 = 1'b1;
  assign C1 = 1'b1;
  assign C2 = 1'b1;
  assign C3 = 1'b1;
  assign C4 = 1'b1;
  
endmodule
