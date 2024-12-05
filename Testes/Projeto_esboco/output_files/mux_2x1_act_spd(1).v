module mux_2x1_act_spd (
	 input sel, A_P, B_P, C_P, A_A, B_A,       // Seletor de entrada
    output A, B, C, D, E, F, G   // Saída do MUX
);
	
	 wire A_0, B_0, C_0, D_0, E_0, F_0, G_0, A_1, B_1, C_1, D_1, E_1, F_1, G_1;

	 // Gerando os sinais de seleção para as portas AND
	 
    wire not_sel;
	 
    not not_sel0 (not_sel, sel);

    // Passando as entradas através das portas AND
	 
    wire out_A_0, out_B_0, out_C_0, out_D_0, out_E_0, out_F_0, out_G_0, out_A_1, out_B_1, out_C_1, out_D_1, out_E_1, out_F_1, out_G_1;
	 
    and and_gate0 (out_A_0, A_0, not_sel);
    and and_gate1 (out_B_0, B_0, not_sel);
    and and_gate2 (out_C_0, C_0, not_sel);
    and and_gate3 (out_D_0, D_0, not_sel);
	 and and_gate4 (out_E_0, E_0, not_sel);
    and and_gate5 (out_F_0, F_0, not_sel);
	 and and_gate6 (out_G_0, G_0, not_sel);


    and and_gate7 (out_A_1, A_1, sel);
    and and_gate8 (out_B_1, B_1, sel);
    and and_gate9 (out_C_1, C_1, sel);
    and and_gate10 (out_D_1, D_1, sel);
	 and and_gate11 (out_E_1, E_1, sel);
    and and_gate12 (out_F_1, F_1, sel);
    and and_gate13 (out_G_1, G_1, sel);

    // Combinando as saídas das portas AND com uma porta OR
	 
    or or_gate0 (A, out_A_0, out_A_1);
    or or_gate1 (B, out_B_0, out_B_1);
    or or_gate2 (C, out_C_0, out_C_1);
    or or_gate3 (D, out_D_0, out_D_1);
	 or or_gate4 (E, out_E_0, out_E_1);
	 or or_gate5 (F, out_F_0, out_F_1);
	 or or_gate6 (G, out_G_0, out_G_1);
	 
	 decoder_3to7seg decoder_inst (
		
	 
	 )
	 
	 
	 dec_7seg_act dis_act_inst (
		.S_a(A_0),
		.S_b(B_0),
		.S_c(C_0),
		.S_d(D_0),
		.S_e(E_0),
		.S_f(F_0),
		.S_g(G_0),
		.A(A_x),
		.B(B_x),
		.C(C_x)
	);


	);

endmodule