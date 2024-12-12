module clkdivider7 (
    input clk,
    input rst,
    output reg clk_div_7
);

	localparam constNumber = 7142857;

	reg [31:0] count;
	 
	always @ (posedge clk or posedge rst) begin
	
		if (rst == 1'b1)
		
		 count <= 32'b0;
		 
		else if (count == constNumber - 1)
		
		 count <= 32'b0;
		 
		else
		
		 count <= count + 1;
		 
	end


	always @ (posedge(clk), posedge(rst)) begin
	
		if (rst == 1'b1)
		
		 clk_div_7 <= 1'b0;
		 
		else if (count == constNumber - 1)
		
		 clk_div_7 <= ~clk_div_7;
		 
		else
		
		 clk_div_7 <= clk_div_7;
		 
	end

endmodule