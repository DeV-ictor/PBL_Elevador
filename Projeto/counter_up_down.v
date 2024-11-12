module counter_up_down (
    input clk,
    input reset,
    input up_down, // 1 para contar para cima, 0 para contar para baixo
    output reg [2:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 3'b000; // Reseta o contador para 0
        end else if (up_down) begin // Contando para cima
            count <= count + 1;
        end else begin // Contando para baixo
            count <= count - 1;
        end
    end

endmodule
