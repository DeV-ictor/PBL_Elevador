module mef_elevator (
    input clk,         // Clock
    input reset,         // Reset
    input P,           // Estado da porta (1: fechada)
    input B0, B1,      // Chamadas do elevador
	 output [1:0] EA, Engine
);

    // Definindo os estados usando parâmetros
    parameter ANDAR1 = 2'b00;
    parameter ANDAR2 = 2'b01;
    parameter ANDAR3 = 2'b10;
    parameter NONE = 2'b11;

    // Registro para o estado atual e próximo estado

    reg [1:0] estado_atual, proximo_estado;

    // Lógica de Transição de Estado
    always @(posedge clk or posedge reset) begin
	 
        if (reset) begin
		  
            estado_atual <= ANDAR1; // Estado inicial
				
        end else begin
		  
            estado_atual <= proximo_estado;
				
        end
    end

    // Lógica de Próximo Estado
    always @(*) begin
	 
        proximo_estado = estado_atual; // Estado padrão é o estado atual
        
        if (P) begin
		  
            case (estado_atual)
				
                ANDAR1: 

                    if (B0 == 0 && B1 == 1)

                        proximo_estado = ANDAR2;

                    else if (B0 == 1 && B1 == 0)

                        proximo_estado = ANDAR2;

                    else

                        proximo_estado = estado_atual;

                ANDAR2: 
					 
                    if (B0 == 0 && B1 == 0)
						  
                        proximo_estado = ANDAR1;
								
                    else if (B0 == 1 && B1 == 0)
						  
                        proximo_estado = ANDAR3;
								
						  else
						  
								proximo_estado = estado_atual;
					 
                ANDAR3: 
					 
                    if (B0 == 0 && B1 == 0)
						  
                        proximo_estado = ANDAR2;
								
                    else if (B0 == 0 && B1 == 1)
						  
                        proximo_estado = ANDAR2;
								
						  else
						  
								proximo_estado = estado_atual;
						  
                NONE:
					 
                    proximo_estado = ANDAR1;
						  
                default:
					 
                    proximo_estado = ANDAR1; // Estado padrão de fallback
					 
            endcase
				
        end else
		  
				proximo_estado = estado_atual;
								  
    end

    // Saídas
	 
    assign EA[0] = estado_atual[0];
    assign EA[1] = estado_atual[1];
	 assign Engine[0] = (P & B0 & ~B1 & ~EA[0]);
	 assign Engine[1] = (P & ~B0 & EA[0] & ~EA[1]) || (P & ~B0 & ~B1 & ~EA[0] & EA[1]);

endmodule