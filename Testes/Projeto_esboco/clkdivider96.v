module clkdivider96 (
    input clk,
    input rst,
    output reg clk_div_96
);

	localparam constNumber = 130208;

	reg [31:0] count;
	 
	always @ (posedge(clk), posedge(rst))
	begin
		if (rst == 1'b1)
		 count <= 32'b0;
		else if (count == constNumber - 1)
		 count <= 32'b0;
		else
		 count <= count + 1;
	end


	always @ (posedge(clk), posedge(rst))
	begin
		if (rst == 1'b1)
		 clk_div_96 <= 1'b0;
		else if (count == constNumber - 1)
		 clk_div_96 <= ~clk_div_96;
		else
		 clk_div_96 <= clk_div_96;
	end

endmodule