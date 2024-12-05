module Display (
	input clk, reset, A_0, B_0, C_0, A_1, B_1,
	output A, B, C, D, E, F, G, DIG1, DIG2, DIG3, DIG4
);

	wire clock;

	clkdivider96 inst_Clk (
		.clk(clk),
		.rst(reset),
		.clk_div_96(clock)
	);

	mux_2x1_lvl_ppl inst_mux(
		.sel(clock),
		.A_P(A_0),
		.B_P(B_0),
		.C_P(C_0),
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
	
	assign DIG1 = clock;
	
	assign DIG2 = 1'b1;
	
	assign DIG3 = 1'b1;
	
	assign DIG4 = ~clock;

endmodule