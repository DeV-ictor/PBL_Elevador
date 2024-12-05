module counter_up_down (
    input clk, reset, up, down, P,
	 output alarm
);
	
	 reg [2:0] count;

    always @ (posedge clk or negedge reset) begin
        
		  if (!reset) begin
		  
            count <= 3'b000; // Reseta o contador para 0
				
        end else begin
		  
				if (!P) begin
		  
					if (!up & count != 3'b111)
					
						count <= count + 1;
					
					else if (!down & count != 3'b000)
						
						count <= count - 1;
						
					else
					
						count <= count;
						
				end else
					
					if (!up & count != 3'b111)
					
						count <= count;
					
					else if (!down & count != 3'b000)
						
						count <= count;
						
					else
					
						count <= count;
					
				end
    end
	 
	 assign alarm = (count == 3'b111);

endmodule
