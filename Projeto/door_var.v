module door_var (
	input B0, B1, E0, E1,
	output var
);

	assign var = (B0 & ~B1 & ~E0) || (~B0 & B1 & ~E1) || (~B0 & E0 & ~E1) || (~B1 & ~E0 & E1);
	
endmodule