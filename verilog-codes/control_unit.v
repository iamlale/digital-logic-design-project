module control_unit(
  input [4:0] opcode,
  output reg mem_read,
  output reg mem_write,
  output reg reg_write,
  output reg alu_op1,
  output reg alu_op2,
  output reg alu_op3,
  output reg alu_op4,
  output reg alu_op5,
  output reg alu_op6,
  output reg alu_op7,
  output reg alu_op8,
  output reg alu_op9,
  output reg alu_op10,
  output reg jump,
  output reg ld,
  output reg st,
  output reg be,
  output reg bne,
  output reg push,
  output reg pop
);
  always @(*) begin
    case(opcode)
      5'b00000: alu_op1 = 1'b1; reg_write = 1'b1; // ADD
      5'b00010: alu_op2 = 1'b1; reg_write = 1'b1; // SUB
      5'b00100: alu_op3 = 1'b1; reg_write = 1'b1; // AND
      5'b00110: alu_op4 = 1'b1; reg_write = 1'b1; // OR
      5'b01000: alu_op5 = 1'b1; reg_write = 1'b1; // XOR
      5'b00001: alu_op6 = 1'b1; reg_write = 1'b1; // ADDI
      5'b00011: alu_op7 = 1'b1; reg_write = 1'b1; // SUBI
      5'b00101: alu_op8 = 1'b1; reg_write = 1'b1; // ANDI
      5'b00111: alu_op9 = 1'b1; reg_write = 1'b1; // ORI
      5'b01001: alu_op10 = 1'b1; reg_write = 1'b1; // XORI
      5'b01110: jump = 1'b1; // JUMP
      5'b01010: ld = 1'b1; mem_read = 1'b1; reg_write = 1'b1; // LD
      5'b01100: st = 1'b1; mem_write = 1'b1; // ST
      5'b10100: be = 1'b1; // BE
      5'b10101: bne = 1'b1; // BNE
      5'b10000: push = 1'b1; // PUSH
      5'b10010: pop = 1'b1; // POP
    endcase
  end
endmodule
