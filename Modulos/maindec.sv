`define OUT_ASSIGN(RL, AS, MR, RW, MRE, MW, BR, AO) \
      begin \
        Reg2Loc = RL; ALUSrc = AS; MemtoReg = MR; RegWrite = RW; \
        MemRead = MRE; MemWrite = MW; Branch = BR; ALUOp = AO; \
      end


module maindec
  (input logic [10:0] Op,
   output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, 
                MemRead, MemWrite, Branch,
   output logic [1:0] ALUOp );

  always_comb 
    begin
      casez (Op)
        11'b111_1100_0010: `OUT_ASSIGN(0, 1, 1, 1, 1, 0, 0, 0) // LDUR 
        11'b111_1100_0000: `OUT_ASSIGN(1, 1, 0, 0, 0, 1, 0, 0) // STUR 
        11'b101_1010_0???: `OUT_ASSIGN(1, 0, 0, 0, 0, 0, 1, 1) // CBZ
        11'b1?0_0101_1000: `OUT_ASSIGN(0, 0, 0, 1, 0, 0, 0, 2) // ADD/SUB
        11'b10?_0101_0000: `OUT_ASSIGN(0, 0, 0, 1, 0, 0, 0, 2) // AND/OR
        default: `OUT_ASSIGN(0, 0, 0, 0, 0, 0, 0, 0)
      endcase
    end

endmodule



/*
Nombre del Módulo:maindec
  Puertos de entrada
    Op: 11 bits
  Puertos de salida
    Reg2Loc: 1 bit
    ALUSrc: 1 bit
    MemtoReg: 1 bit
    RegWrite: 1 bit
    MemRead: 1 bit
    MemWrite: 1 bit
    Branch: 1 bit
    ALUOp: 2 bits

*/
