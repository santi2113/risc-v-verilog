module mux2 (
    input [31:0] a,
    input [31:0] b,
    input rs1pc,
    output [31:0] x
);
    assign x = rs1pc ? b : a;
endmodule
