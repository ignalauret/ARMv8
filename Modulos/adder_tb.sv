module adder_tb();
  logic [63:0] a, b, out;

  adder addi(a, b, out);

  initial begin
    $display("Test start");
    a = 64'h0000_0000_0000_0000;
    b = 64'h0000_0000_0000_0004;
    #10;
    if(out != 64'h0000_0000_0000_0004)
      $display("i\tBad result");
    a = 64'hFFFF_FFFF_FFFF_FFFF;
    b = 64'h0000_0000_0000_0013;
    #10;
    $display("\tResult of overflow: 0x%h", out);
    $display("Test end");
  end
endmodule
