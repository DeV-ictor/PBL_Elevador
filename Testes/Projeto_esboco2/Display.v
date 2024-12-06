module Display (
	input clk, reset, A_1, B_1, UP, DOWN, P,
	output A, B, C, D, E, F, G, DIG1, DIG2, DIG3, DIG4
);
	
	wire clock96;
	
	wire AP, BP, CP;

	clkdivider96 inst_Clk (
		.clk(clk),
		.clk_div_96(clock96)
	);
	

	mux_2x1_lvl_ppl inst_mux(
		.sel(clock96),
		.A_P(AP),
		.B_P(BP),
		.C_P(CP),
		.A_A(A_1),
		.B_A(B_1),
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.E(E),
		.F(F),
		.G(G)
	);
	
	assign DIG1 = clock96;
	
	assign DIG2 = 1'b1;
	
	assign DIG3 = 1'b1;
	
	assign DIG4 = ~clock96;

endmodule