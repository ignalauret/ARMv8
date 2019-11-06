`define CLK_TIME 10000          //`CLK_TIMEps is the period of 100Mhz

module fetch_tb();
  logic clk, reset, PCSrc_F;
  logic [63:0] PCBranch_F, imem_addr_F;
  
  fetch fetchi(PCSrc_F, clk, reset, PCBranch_F, imem_addr_F);

  always
    begin
      clk = ~clk;
      #5000;
    end

  
  initial 
    begin
      $display("Starting test");
      clk = 0;
      reset = 1;
      PCSrc_F = 0;
      PCBranch_F = 64'hAAAA_BBBB_CCCC_DDDD;
      #(`CLK_TIME * 5);
      reset = 0;
      for(int i = 1; i < 6; i++) begin
        #`CLK_TIME;
        if(imem_addr_F != i*4) $display("\tBad PC added");
      end
      PCSrc_F = 1;
      #`CLK_TIME;
      if(imem_addr_F != PCBranch_F) $display("\tBad PC on branch source"); 
      $display("Test end");
      $finish;
  end
endmodule
