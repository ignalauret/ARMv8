`define CLK_TIME 10000          //`CLK_TIMEps is the period of 100Mhz

module regfile_tb();
   logic clk, we3;
   logic [4:0] ra1, ra2, wa3;
   logic [63:0] wd3, rd1, rd2;

  regfile registers(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);

  always
    begin
      clk = ~clk;
      #5000;
    end

  initial
    begin
    $display("Test starting...");
    clk = 0;
    $display("\tTesting register initialization");
    for(logic [4:0] i = '0; i < 31; i++) begin
      ra1 = i;
      ra2 = i;
      #`CLK_TIME;
      if (rd1 != ra1) $display("\t\tWrong value on register: X%d\n\t\t\tHave 0x%h and want 0x%d", i, rd1, ra1);
    end
    ra1 = 5'h1F;
    #10
    if(rd1 != 64'h0000_0000_0000_0000) $display("\t\tWrong value on register: X31");
    $display("\tRegister Test finish");

    $display("\tWriting test start");
    #`CLK_TIME;
    wa3 = 4'd14;
    wd3 = 64'hFFFF_AAAA_FFFF_CCCC;
    we3 = 0;
    ra1 = 4'd14;
    #`CLK_TIME;
    if (rd1 != 'd14) $display("\tWrong writing on register, enabel = 0 buy write aniway");
    we3 = 1;
    #`CLK_TIME;
    if (rd1 != 64'hFFFF_AAAA_FFFF_CCCC) $display("\t\tWrong writing on register");
    wa3 = 8'd31;
    ra1 = 9'd31;
    #`CLK_TIME;
    if (rd1 != 64'h0000_0000_0000_0000) $display("\t\tRegister X31 writed with 0x%h", rd1);
    $display("\tWriting test end");
    $display("Testing ending");
    $finish;
    end
endmodule
    
