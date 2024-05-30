`timescale 1ns / 1ps
`include "top.v"


module top_tb;

    // Parámetros de entrada
    reg [31:0] aluout;
    reg pcjump;
    reg clk;

    // Parámetros de salida
    wire [31:0] y, pc4, pc;

    // Instanciación del módulo bajo prueba
    top dut (
        .aluout(aluout),
        .pcjump(pcjump),
        .clk(clk),
        .y(y),
        .pc4(pc4),
        .pc(pc)
    );

    // Clock generation
    always #10 clk = ~clk;

    // Inicialización de las señales de entrada
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        clk = 0;
        aluout = 32'h00000000;
        pcjump = 1'b1;

        // Ejemplo de prueba
        #10 aluout = 32'h00000000; // Simula una salida de ALU
        #10 pcjump = 1'b0; // Simula un salto de PC
        #100 $finish; // Finaliza la simulación
    end

    // Monitoreo de las señales de salida
    always @(posedge clk) begin
        $display("Time=%0t, y=%h, pc4=%h, pc=%h", $time, y, pc4, pc);
    end

endmodule
