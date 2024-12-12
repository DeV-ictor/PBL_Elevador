module decoder_3callsto2 (
		input A_e, B_e, C_e, A_i, B_i, C_i,
		output B0, B1
);

	wire call_a, call_b, call_c;

	or A (call_a, A_e, A_i);
	or B (call_b, B_e, B_i);
	or C (call_c, C_e, C_i);

	assign B0 = (call_a & ~call_c);
	assign B1 = (call_a & call_b & call_c) || (~call_a & call_b & ~call_c);

endmodule