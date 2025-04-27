module numeros_com_sinal(
    input signed [7:0] entrada_signed_1,
    input signed [3:0] entrada_signed_2,
    input [7:0] entrada_unsigned_1,
    input [3:0] entrada_unsigned_2,
    input [1:0] codigo,
    output reg [7:0] saida
);

always @ (codigo) begin // Como a saída é um reg, ela pode ser manipulada em um bloco always.
    case(codigo)
        2'b00: saida = entrada_signed_1 + entrada_signed_2; // signed_1 + signed_2
        2'b01: saida = entrada_unsigned_1 + entrada_unsigned_2; // unsigned_1 + unsigned_2
        2'b10: saida = entrada_unsigned_1 + entrada_signed_1; // unsigned_1 + signed_1
        2'b11: saida = entrada_unsigned_1 + entrada_unsigned_2; // unsigned_1 + signed_2
        default: saida = 8'b00000000; // Zera se código for qualquer outro valor
    endcase
end

endmodule