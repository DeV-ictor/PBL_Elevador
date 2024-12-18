module system (
	input clk, reset, // Entradas gerais de clock e reset
	input Up, Down, // Entradas para controlar o número de pessoas
	input A_e, B_e, C_e, A_i, B_i, C_i,  // Chamadas do elevador
	output A, B, C, D, E, F, G, P, DIG1, DIG2, DIG3, DIG4, // Saídas do display
	output alarme, door_o, door_c, // Saídas do alarme e da porta
	output [9:0] LEDS
);

	// Frequências para funcionamento do circuito - begin
	
	wire clk1, clk96, not_reset;
	
	not (not_reset, reset);
	
		// 1Hz

	clkdivider1 clk_inst1 (
		.clk(clk),
		.rst(not_reset),
		.clk_div_1(clk1)
	);
	
		// 96Hz
	
	clkdivider96 clk_inst3 (
		.clk(clk),
		.rst(not_reset),
		.clk_div_96(clk96)	
	);
	
	// Frequências para funcionamento do circuito - end
	
	// Máquinas de estado do circuito - begin
	
			// Pessoas - begin
	
	wire count [2:0];
	wire alarm;
	
	mef_people mef_p_inst (
		.clk(clk1),
		.reset(not_reset),
		.up(Up),
		.down(Down),
		.P(door_state),
		.count({count[0], count[1], count[2]}),
		.alarm(alarm)
	);
	
			// Pessoas - end
			
			// Porta - begin
			
					// Variável para configuração do estado da porta
					
	wire var;
					
	door_var door_calls_inst (
		.B0(B0),
		.B1(B1),
		.E0({EA[0]}),
		.E1({EA[1]}),
		.var(var)
	);
			
	wire door_state;
	
	mef_door mef_d_inst (
		.clk(clk1),
		.reset(not_reset),
		.alarm(alarm),
		.calls(var),
		.door(door_state)
	);

			// Porta - end
			
			// Elevador - begin
			
					// Decodificador das chamadas
					
	wire B0, B1;
			
	decoder_3callsto2 decoder_calls_inst (
		.A_e(A_e),
		.B_e(B_e),
		.C_e(C_e),
		.A_i(A_i),
		.B_i(B_i),
		.C_i(C_i),
		.B0(B0),
		.B1(B1)
	);
	
	wire [1:0] EA, engine;
	
	mef_elevator mef_e_inst (
		.clk(clk1),
		.reset(not_reset),
		.B0(B0),
		.B1(B1),
		.P(door_state),
		.EA({EA[0], EA[1]}),
		.Engine({engine[0], engine[1]})
	);
	
			// Elevador - end
	
	// Máquinas de estado do circuito - end
	
	// Display - begin
	
	Display display_inst (
		.clk96(clk96),
		.A_A({EA[0]}),
		.B_A({EA[1]}),
		.A_P({count[0]}),
		.B_P({count[1]}),
		.C_P({count[2]}),
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.E(E),
		.F(F),
		.G(G),
		.P(P),
		.DIG1(DIG1),
		.DIG2(DIG2),
		.DIG3(DIG3),
		.DIG4(DIG4)
	);

	// Display - end
	
	// Saída motor - begin
	
	assign LEDS[0] = engine[0];
	assign LEDS[1] = engine[0];
	assign LEDS[2] = engine[0];
	assign LEDS[3] = engine[0];
	assign LEDS[4] = engine[0];
	assign LEDS[5] = engine[1];
	assign LEDS[6] = engine[1];
	assign LEDS[7] = engine[1];
	assign LEDS[8] = engine[1];
	assign LEDS[9] = engine[1];
	
	// Saída motor - begin
	
	assign alarme = alarm; // alarme
	assign door_c = door_state; // porta fechada
	assign door_o = !door_state; // porta aberta

endmodule