`include "adder.v"
`include "p_memory.v"
`include "mux_2a1.v"
`include "pc.v"
`include "immunit.v"
`include "instdec.v"


module top (
    input [31:0] aluout,
    input pcjump,
    input clk,
    output [31:0] y ,pc4 ,pc,data_out,imm, inst,
    output  [6:0] opcode,
    output  [4:0] rd,
    output  [2:0] func3,
    output  [4:0] rs1,
    output  [4:0] rs2,
    output  [6:0] func7
);

    // Instancia del sumador de 32 bits
    adder sumador (
        .pc(pc),
        .pc4(pc4)
    );

    // Instancia del multiplexor 2 a 1
    mux_2a1 mux (
        .pc4(pc4),
        .aluout(aluout),
        .pcjump(pcjump),
        .y(y)
    );

    // Instancia del módulo pc
    pc pc_reg (
        .input_data(y),       // Conectar la salida del multiplexor a la entrada pcin del módulo pc
        .enable(1'b1),     // Mantener siempre enable en 1
        .reset(32'b0),      // Mantener siempre reset en 0
        .clk(clk),
        .output_data(pc)  
    );

    p_memory memory_inst  (
        .address(pc),
        .data_out(data_out)

    );

    immunit imm_un  (
        .inst(data_out),
        .imm(imm)

    );

    instdec inst_dec  (
        .inst(inst),
        .opcode(opcode),
        .rd(rd),
        .func3(func3),
        .rs1(rs1),
        .rs2(rs2),
        .func7(func7)

        
    );

endmodule
