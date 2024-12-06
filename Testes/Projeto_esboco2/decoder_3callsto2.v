module decoder_3callsto2 (
		input A, B, C,
		output B0, B1
);

	assign B0 = (A & ~C);
	assign B1 = (A & B & C) || (~A & B & ~C);

endmodule