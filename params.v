// Here are the parameter definitions for all modules
parameter ADDRESS_BUS_WIDTH = 13 ;
parameter DATA_BUS_WIDTH = 32 ;
parameter REGFILE_ADDR_BITS = 3 ;
parameter WIDTH_OPCODE = 6 ;
parameter INSTRUCTION_WIDTH = 23 ;
parameter IMMEDIATE_WIDTH = 8 ;
// The instruction definitions
parameter INSTR_NOP = 0 ;
parameter INSTR_ADD = 1 ;
parameter INSTR_LR = 2 ;
parameter INSTR_SR = 3 ;
parameter INSTR_BNEQ = 4 ;
parameter INSTR_MOV = 5 ;
parameter INSTR_LI = 6 ;
parameter INSTR_ADDI = 7 ;
// ALU parameters
parameter ALU_OP_NUM_BITS = 3 ;
parameter ALU_NUM_OPS = 1 << ALU_OP_NUM_BITS ;
parameter ALU_OP_ADD = 0 ;
parameter ALU_OP_SUB = 1 ;

// PC select mux value
parameter PC_SELECT_ALU = 0 ;
parameter PC_SELECT_ALU_BUF = 1 ;
parameter PC_SELECT_JUMP = 2 ;
parameter PC_SELECT_RESET = 3 ;


// Calculated parameters
parameter NUM_ADDRESS = 1 << ADDRESS_BUS_WIDTH ;
parameter PROGRAM_LOAD_ADRESS = NUM_ADDRESS >> 1 ;
parameter NUM_REGISTERS = 1 << REGFILE_ADDR_BITS ;
parameter NUM_INSTRUCTIONS = 1 << WIDTH_OPCODE ;
parameter WIDTH_REGISTER_FILE = DATA_BUS_WIDTH ;
parameter ADDRESS_PAD = DATA_BUS_WIDTH - ADDRESS_BUS_WIDTH ;
parameter INSTRUCTION_PAD = (DATA_BUS_WIDTH << 1) - INSTRUCTION_WIDTH ;
