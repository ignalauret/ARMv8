`define TEST_OUTPUT(OPCO, AL, AS, MR, RW, MRE, MW, BR, AO) \
  Op = OPCO; \
  #10; \
  if (Reg2Loc != AL || ALUSrc != AS || MemtoReg != MR || \
      RegWrite != RW || MemRead != MRE || MemWrite != MW || \
      Branch != BR || ALUOp != AO) \
      $display("\tBad output on operation 0x%h", OPCO);

module maindec_tb();
  logic [10:0] Op;
  logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, 
        MemRead, MemWrite, Branch;
  logic [1:0] ALUOp;
  
  maindec mini(Op, Reg2Loc, ALUSrc, MemtoReg, 
               RegWrite, MemRead, MemWrite, Branch, ALUOp);
  
  initial begin
    $display("Starting test...");
    #10;
    `TEST_OUTPUT(11'b111_1100_0010, 0, 1, 1, 1, 1, 0, 0, 2'b00)
    `TEST_OUTPUT(11'b111_1100_0000, 1, 1, 0, 0, 0, 1, 0, 2'b00)
    `TEST_OUTPUT(11'b101_1010_0101, 1, 0, 0, 0, 0, 0, 1, 2'b01)
    `TEST_OUTPUT(11'b100_0101_1000, 0, 0, 0, 1, 0, 0, 0, 2'b10)
    `TEST_OUTPUT(11'b110_0101_1000, 0, 0, 0, 1, 0, 0, 0, 2'b10)
    `TEST_OUTPUT(11'b100_0101_0000, 0, 0, 0, 1, 0, 0, 0, 2'b10)
    `TEST_OUTPUT(11'b101_0101_0000, 0, 0, 0, 1, 0, 0, 0, 2'b10)
    `TEST_OUTPUT(11'b101_1111_0000, 0, 0, 0, 0, 0, 0, 0, 2'b00)
    $display("Test finished");
  end
endmodule
