`define RD 11:7
`define RS1 19:15 
`define RS2 24:20
`define OPCODE 6:0
`define FUNT3 14:12
`define FUNT7 30
`define FUNT2 26:25
`define FUNT5 31:26
`define shift 24:20 
//load (comes in I format) 
`define LB (instr[`OPCODE]==7'b0000011 && instr[`FUNT3]==3'b000 )
`define LH (instr[`OPCODE]==7'b0000011 && instr[`FUNT3]==3'b001 )
`define LW (instr[`OPCODE]==7'b0000011 && instr[`FUNT3]==3'b010 )
`define LBU (instr[`OPCODE]==7'b0000011 && instr[`FUNT3]==3'b100 )
`define LHU (instr[`OPCODE]==7'b0000011 && instr[`FUNT3]==3'b101 )
//TYPE S
`define SB (instr[`OPCODE]==7'0100011 && instr[`FUNT3]==3'b000 )
`define SH (instr[`OPCODE]==7'0100011 && instr[`FUNT3]==3'b001 )
`define SW (instr[`OPCODE]==7'0100011 && instr[`FUNT3]==3'b010 )
//TYPE R
`define ADD (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b000 && instr[`FUNT7]==0)
`define SUB (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b000 && instr[`FUNT7]==1)
`define SLL (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b001)
`define SLT (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b010)
`define SLTU (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b011)
`define XOR (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b100)
`define SRL (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b101&& instr[`FUNT7]==0)
`define SRA (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b101&& instr[`FUNT7]==1)
`define OR (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b110)
`define AND (instr[`OPCODE]==7'0110011 && instr[`FUNT3]==3'b111)

//TYPE I

`define ADDI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b000)
`define SLTI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b010)
`define SLTIU (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b011)
`define XORI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b100)
`define ORI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b110)
`define ANDI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b111)
`define SLLI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b001)
`define SRLI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b101&& instr[`FUNT7]==0)
`define SRAI (instr[`OPCODE]==7'0010011 && instr[`FUNT3]==3'b101&& instr[`FUNT7]==1)

// TYPE B

`define beq (instr[`OPCODE]==7'1100011 && instr[`FUNT3]==3'b000)
`define bne (instr[`OPCODE]==7'1100011 && instr[`FUNT3]==3'b001)
`define blt (instr[`OPCODE]==7'1100011 && instr[`FUNT3]==3'b100)
`define bge (instr[`OPCODE]==7'1100011 && instr[`FUNT3]==3'b101)
`define bltu (instr[`OPCODE]==7'1100011 && instr[`FUNT3]==3'b110)
`define bgeu (instr[`OPCODE]==7'1100011 && instr[`FUNT3]==3'b111)


// TYPE J

`define jal (instr[`OPCODE]==7'1101111)

// TYPE J (I FORMAT)

`define jalr (instr[`OPCODE]==7'1100111 && instr[`FUNT3]==3'b000)