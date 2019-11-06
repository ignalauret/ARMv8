module alu_tb();
    logic [63:0] a, b, result; 
    logic [3:0] ALUControl;
    logic zero;

    alu alita(a, b, ALUControl, result, zero);
  
    initial begin
        $display("Test Starting..");
        #10;
        a = '0;
        b = '0;
        ALUControl = '0;
        #10;

        // AND test
        $display("\tAND test start");

        ALUControl = 4'b0000;
        a = 64'hAAAA_AAAA_AAAA_AAAA;
        b = 64'h0000_0000_FFFF_FFFF;
        #1;
        if (result !=  64'h0000_0000_AAAA_AAAA ) 
          $display("\t\tTest fail on AND operation && case 1");
        #10;
        a = '0;
        #1;
        if (result != 0 || zero != 1)
          $display("\t\tTest fail on AND operation && case 2");

        $display("\tAND test finish");
        #10;

        // OR test
        $display("\tOR test start");
        
        ALUControl = 4'b0001;
        a = 64'hAAAA_AAAA_AAAA_AAAA;
        b = 64'h5555_5555_5555_5555;
        #1;
        if (result != 64'hFFFF_FFFF_FFFF_FFFF || zero != 0)
          $display("\t\tTest fail on OR operation && case 1");
        #10;
        a = '0;
        b = '0;
        #1;
        if (result != 64'h0000_0000_0000_0000 || zero != 1)
          $display("\t\tTest fail on OR operation && case 2");
        
        $display("\tOR test finish");
        #10;

        //ADD test
        $display("\tADD test start");

        ALUControl = 4'b0010;
        a = '0;
        b = '0;
        a = 32'h01234567;
        b = 32'h89ABCDEF;
        #1;
        if(result != 32'h8ACF1356 || zero != 0)
          $display("\t\tTest fail on ADD operation && case 1");
        #10
        a = -25;
        b = 4;
        #1;
        if(result != -21 || zero != 0)
          $display("\t\tTest fail on ADD operation && case 2");
        #10;
        a = 64'hFFFF_FFFF_FFFF_FFFF;
        b = 64'h0000_0000_0000_000A;
        $display("\t\tADD overflow test resuts: \n\t\t\tresult: %h, zero: %b", result, zero);
        
        $display("\tADD test finish");
        #10;
      
        // SUB test
        $display("\tSUB test start");
        ALUControl = 4'b0110;
        a = 64'hFFFF_FFFF_FFFF_FFFF;
        b = 64'hAAAA_AAAA_AAAA_AAAA;
        #1;
        if (result != 64'h5555_5555_5555_5555 || zero != 0)
          $display("\t\tTest fail on SUB operation && case 1");
        #10;
        a = 64'hCCCC_CCCC_CCCC_CCCC;
        b = 64'hCCCC_CCCC_CCCC_CCCC;
        #1;
        if(result != 64'h0000_0000_0000_0000 || zero != 1)
          $display("\t\tTest fail on SUB operation && case 2");
        #10;
        a = 32'h0123_4567;
        b = 32'h89AB_CDEF;
        #1;
        if(result != -64'h8888_8888 || zero != 0)
          $display("\t\tTest fail on SUB operation && case 3");
        
        $display("\tSUB test finish");
        #10;

        // PASS INPUT B test
        $display("\tPASS INPUT B test start");
        ALUControl = 4'b0111;
        a = 64'hFFFF_FFFF_FFFF_FFFF;
        b = 64'hAAAA_AAAA_AAAA_AAAA;
        #1;
        if(result != 64'hAAAA_AAAA_AAAA_AAAA || zero != 0)
          $display("\t\tTest fail on PASS INPUT B operation && case 1");
        a = 64'hFFFF_FFFF_FFFF_FFFF;
        b = 64'h0000_0000_0000_0000;
        #1;
        if(result != 64'h0000_0000_0000_0000 || zero != 1)
          $display("\t\tTest fail on PASS INPUT B operation && case 2");
        
        $display("\tPASS INPUT B test finish");
        #10;

        // NOR test
        $display("\tNOR test start");
      
        ALUControl = 4'b1100;
        a = 64'hAAAA_AAAA_AAAA_AAAA;
        b = 64'h5555_5555_5555_5555;
        #1;
        if(result != 64'hFFFF_FFFF_FFFF_FFFF || zero != 0)
          $display("\t\tTest fail on NOR operation && case 1");
        #10;
        a = 64'hAAAA_AAAA_AAAA_AAAA;
        b = 64'hAAAA_AAAA_AAAA_AAAA;
        #1;
        if(result != 64'h0000_0000_0000_0000 || zero != 1)
          $display("\t\tTest fail on NOR operation && case 2");
        
        $display("\tNOR test finish");
        #10;
        
        // DEFAULT test
        $display("\tDEFAULT test start");
        
        ALUControl = 4'b1010;
        b = 64'hFFFF_FFFF_FFFF_FFFF;
        a = 64'hAAAA_AAAA_AAAA_AAAA;
        #1;
        if(result != 64'hAAAA_AAAA_AAAA_AAAA || zero != 0)
          $display("\t\tTest fail on DEFAULT operation && case 1");
        b = 64'hFFFF_FFFF_FFFF_FFFF;
        a = 64'h0000_0000_0000_0000;
        #1;
        if(result != 64'h0000_0000_0000_0000 || zero != 1)
          $display("\t\tTest fail on DEFAULT operation && case 2");
        
        $display("\tDEFAULT test finish");
        #10;

        $display("Test finished...");
        
    end
endmodule
