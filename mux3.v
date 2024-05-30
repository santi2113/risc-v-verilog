module mux3 (
    input [31:0] a,
    input [31:0] b,
    input immreg,
    output [31:0] immed
);
    assign immed = immreg ? b : a;
endmodule
