`include "top.v"
`timescale 1ns/1ps

module tb_top();

    // Inputs
    reg clk;

    // Outputs
    wire [31:0] y, x, immed, pc4, aluout, pc;
    wire [31:0] inst, imm, rs1Data, rs2Data, dmout, res;
    wire [2:0] func3;
    wire [4:0] rs1, rs2, rd;
    wire [6:0] func7, opcode;
    wire immreg, pcjump, rs1pc;
    wire dmwen, rfwenable, brinst, jaljalr;
    wire [1:0] wbsel;
    wire useDM;

    // Instantiate the Unit Under Test (UUT)
    top uut (
        .clk(clk),
        .y(y),
        .x(x),
        .immed(immed),
        .pc4(pc4),
        .aluout(aluout),
        .pc(pc),
        .inst(inst),
        .imm(imm),
        .rs1Data(rs1Data),
        .rs2Data(rs2Data),
        .dmout(dmout),
        .res(res),
        .func3(func3),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .func7(func7),
        .opcode(opcode),
        .immreg(immreg),
        .pcjump(pcjump),
        .rs1pc(rs1pc),
        .dmwen(dmwen),
        .rfwenable(rfwenable),
        .brinst(brinst),
        .jaljalr(jaljalr),
        .wbsel(wbsel),
        .useDM(useDM)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period, 100MHz clock
    end

    // Stimulus process
    initial begin
        // Initialize inputs
        // You can add more stimulus as needed
        #100; // Run for some time
        $stop;
    end

    initial begin
        $monitor("Time: %0t | clk: %b | pc: %h | inst: %h | rs1: %d | rs2: %d | rd: %d | func3: %b | func7: %b | opcode: %b | imm: %h | rs1Data: %h | rs2Data: %h | aluout: %h | dmout: %h | res: %h",
                 $time, clk, pc, inst, rs1, rs2, rd, func3, func7, opcode, imm, rs1Data, rs2Data, aluout, dmout, res);
    end

endmodule
