`include "adder.v"
`include "p_memory.v"
`include "mux4.v"
`include "pc.v"
`include "immunit.v"
`include "instdec.v"
`include "regfile.v"
`include "mux1.v"
`include "mux2.v"
`include "mux3.v"
`include "alu.v"
`include "dmemory.v"
`include "control.v"
`include "branch.v"


module top (
      
    input clk,


    output [31:0] y, x, immed ,pc4, aluout ,pc,
    data_out, imm, inst, out, dmout, rs1Data, rs2Data, out2, res,
     
    output  [2:0] func3,
    output  [4:0] rs1, rs2, rd,
    output  [6:0] func7, opcode,
    output  immreg, pcjump, rs1pc,
    output  dmwen,
    output  rfwenable,
    output  brinst,
    output  jaljalr,
    output  [1:0]wbsel,
    output  useDM
  
);

    // Instancia del sumador de 32 bits
    adder sumador (
        .pc(pc),
        .pc4(pc4)
    );

    // Instancia del multiplexor 2 a 1
    mux1 mux (
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
        .data_out(inst)

    );

    immunit imm_un  (
        .inst(inst),
        .imm(imm)

    );
    // hacer lo soguiente del imm unit 

    instdec inst_dec  (
        .inst(inst),
        .opcode(opcode),
        .rd(rd),
        .func3(func3),
        .rs1(rs1),
        .rs2(rs2),
        .func7(func7)

        
    );

    regfile register_file (
        .enable(rfwen),
        .rdAdrs(rd),
        .rdData(res),
        .rs1Adrs(rs1),
        .rs2Adrs(rs2),
        .clk(clk),
        .rs1Data(rs1Data),
        .rs2Data(rs2Data)


    );

    mux2 mux2a1_2 (
        .a(rs1Data),
        .b(pc),
        .rs1pc(rs1pc),
        .x(x)
        


    );

    mux3 mux2a1_3 (
        .a(rs2Data),
        .b(pc),
        .immreg(immreg),
        .immed(immed)

    );

    alu aluop (
        .op1(x),
        .op2(immed),
        .func3(func3),
        .func7(func7),
        .out(aluout)
        

    );

    dmemory data_memory (
        .clk(clk),
        .func3(func3),
        .wdata(rs2Data),
        .dmwen(dmwen),
        .addr(aluout),
        .dmout(dmout)
        

    );

    mux4 mux_4to1 (
        .in0(out),
        .in1(dmout),
        .in2(pc4),
        .sel(wbsel),
        .res(res)

    );

    control control_inst (
        .instr(inst),
        .immreg(immreg),
        .dmwen(dmwen),
        .rfwenable(rfwenable),
        .brinst(brinst),
        .jaljalr(jaljalr),
        .wbsel(wbsel),
        .useDM(useDM)
        


    );

    branch branch_inst(
        .rs1data(rs1Data),
        .rs2data(rs2Data),
        .func3(func3),
        .binst(brinst),
        .jal(jaljalr),
        .pcjump(pcjump),
        .rs1pc(rs1pc)


    );




endmodule
