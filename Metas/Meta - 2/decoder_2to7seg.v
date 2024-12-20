module decoder_2to7seg (
    input [1:0] binary_in,  // Entrada binária de 2 bits
    output reg [6:0] seg    // Saídas para os segmentos a-g do display
);

always @ (binary_in) begin
    case (binary_in)
        2'b00: seg = 7'b0000110; // 1
        2'b01: seg = 7'b1011011; // 2
        2'b10: seg = 7'b1001111; // 3
    endcase
end

endmodule