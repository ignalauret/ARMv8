module alu
  (input logic [63:0] a, b,
   input logic [3:0] ALUControl,
   output logic [63:0] result,
   output logic zero );

  always_comb 
    begin
      casez (ALUControl)
        4'b0000: result = a & b;
        4'b0001: result = a | b;
        4'b0010: result = a + b;
        4'b0110: result = a - b;
        4'b0111: result = b;
        4'b1100: result = a ^ b;
        default: result = a;
      endcase
      zero = result == 0 ? 1 : 0;
    end

endmodule

/*

Module: alu
Input:
  a: 64 bits
  b: 64 bits
  ALUControl: 4 bits
Output:
  result: 64 bits
  zero: 1 bit

+---------------+----------------+
| Control Lines |     Result     |
+---------------+----------------+
|     0000      |     a AND b    |
+---------------+----------------+
|     0001      |     a OR b     |
+---------------+----------------+
|     0010      |     add (a+b)  |
+---------------+----------------+
|     0110      |     sub (a-b)  |
+---------------+----------------+
|     0111      |  pass input b  |
+---------------+----------------+
|     1100      |     a NOR b    |
+---------------+----------------+
|    DEFAULT    |  pass input a  |
+---------------+----------------+

*/
