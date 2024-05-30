module mux_2a1 (
    input [31:0] pc4,
    input [31:0] aluout,
    input pcjump,
    output [31:0] y
);
    assign y = pcjump ? aluout : pc4;
endmodule
