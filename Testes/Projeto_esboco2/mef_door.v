module mef_door (
	input clk, reset, alarm, calls,
	output door
);

	parameter OPEN = 1'b0;
	parameter CLOSED = 1'b1;
	
	reg state, nextstate;
	
	always @ (posedge clk or negedge reset) begin
	
		if (!reset)
		
			state <= OPEN; // Estado inicial
		
		else
		
			state <= nextstate;
		
	end
	
	always @ (*) begin
	
		if (calls) begin
				
			case (state)
			
				OPEN: 
					
					if (!alarm) 
						
						nextstate = CLOSED;
					
					else
						
						nextstate = state;
						
				CLOSED: 
					
					if (!alarm) 
						
						nextstate = CLOSED;
					
					else
						
						nextstate = state;
						
				default:
						
						nextstate = OPEN;
						
			endcase
		end
	end
	
	assign door = state;

endmodule