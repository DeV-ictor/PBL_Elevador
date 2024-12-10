module mef_people (
    input clk, reset, up, down, P,
	 output alarm,
	 output [2:0] count
);

	 parameter S0 = 3'b000;
	 parameter S1 = 3'b001;
	 parameter S2 = 3'b010;
	 parameter S3 = 3'b011;
	 parameter S4 = 3'b100;
	 parameter S5 = 3'b101;
	 parameter S6 = 3'b110;
	 parameter S7 = 3'b111;
	 
	 reg [2:0] state, next_state;

    always @ (posedge clk or posedge reset) begin
        
		  if (reset)
		  
            state <= 3'b000; // Reseta o contador para 0
				
        else 
			
				state <= next_state;

    end
	 
	 always @ (*) begin
	 	 
		  if (!up) begin
			
				case (state)
					
					S0: 
					
						if (!P) next_state = S1;
						else next_state = S0;
					
					S1:
					
						if (!P) next_state = S2;
						else next_state = S1;
					
					S2:
					
						if (!P) next_state = S3;
						else next_state = S2;
					
					S3:
					
						if (!P) next_state = S4;
						else next_state = S3;
					
					S4:
					
						if (!P) next_state = S5;
						else next_state = S4;
						
					S5:
					
						if (!P) next_state = S6;
						else next_state = S5;
						
					S6:
					
						if (!P) next_state = S7;
						else next_state = S6;
					S7:
					
						if (!P) next_state = S7;
						else next_state = S7;
					
					default:
					
						next_state = state;
					
				endcase
			
		  end else if (!down) begin
			
					case (state)
						
						S0: 
							if(!P) next_state = S0;
							else next_state = state;
						S1: 
							if(!P) next_state = S0;
							else next_state = state;
							
						S2: 
							if(!P) next_state = S1;
							else next_state = state;
							
						S3: 
							if(!P) next_state = S2;
							else next_state = state;
							
						S4: 
							if(!P) next_state = S3;
							else next_state = state;
							
						S5: 
							if(!P) next_state = S4;
							else next_state = state;
							
						S6: 
							if(!P) next_state = S5;
							else next_state = state;
							
						S7: 
							if(!P) next_state = S6;
							else next_state = state;
							
						default: next_state = state;
					
					endcase
				
			end else
		
				next_state = state;
					
	 end
	 
	 assign alarm = (state == 3'b111);
	 
	 assign count[0] = state[0];
	 assign count[1] = state[1];
	 assign count[2] = state[2];	

endmodule
