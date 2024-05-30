module mux4 (
    input [31:0] in0,  // Entrada 0
    input [31:0] in1,  // Entrada 1
    input [31:0] in2,  // Entrada 2
    input [1:0] sel,   // Selector de 2 bits
    output reg [31:0] res // Salida
);

    // Lógica del multiplexor
    always @(*) begin
        case (sel)
            2'b00: res = in0;
            2'b01: res = in1;
            2'b10: res = in2;
        endcase
    end

endmodule
