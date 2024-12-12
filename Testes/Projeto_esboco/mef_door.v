module mef_door (
	input clk, reset, alarm, calls,
	output door
);

	parameter OPEN = 1'b0;
	parameter CLOSED = 1'b1;
	
	reg state, nextstate;
	
	always @ (posedge clk or posedge reset) begin
	
		if (reset) begin
		
			state <= OPEN; // Estado inicial
		
		end else begin
		
			state <= nextstate;
			
		end
	end
	
	always @(*) begin
	
		nextstate = state;
	
		if (calls == 1) begin
				
			case (state)
			
				OPEN: 
					
					if (alarm == 0) 
						
						nextstate = CLOSED;

					else
						
						nextstate = OPEN;
						
				CLOSED: 
					
					if (alarm == 0) 
						
						nextstate = CLOSED;
					
					else
						
						nextstate = OPEN;
						
				default:
						
						nextstate = OPEN;
						
			 endcase
			 
		end else
		
			nextstate = OPEN;
		
	end
	
	assign door = state;

endmodule