module Display (
	input clk96, A_P, B_P, C_P, A_A, B_A,
	output A, B, C, D, E, F, G, P, DIG1, DIG2, DIG3, DIG4
);
	
	wire AP, BP, CP;

	mux_2x1_lvl_ppl inst_mux(
		.sel(clk96),
		.A_P(A_P),
		.B_P(B_P),
		.C_P(C_P),
		.A_A(A_A),
		.B_A(B_A),
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.E(E),
		.F(F),
		.G(G),
	);
	
	assign P = 1'b1;
	
	assign DIG1 = clk96;
	
	assign DIG2 = 1'b1;
	
	assign DIG3 = 1'b1;
	
	assign DIG4 = ~clk96;

endmodule