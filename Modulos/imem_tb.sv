module imem_tb();
    logic [5:0] addr; 
    logic [31:0] q;
    logic [31:0] q_hw;
    logic [63:0] q_dw;

    imem memi(addr, q);
    imem #(16) memi_hw(addr, q_hw);
    imem #(64) memi_dw(addr, q_dw);
  
   always
      begin
          #100;
          $display("\t%h: \n\t\thw:%h\n\t\tw :%h\n\t\tdw:%h", addr, q_hw, q, q_dw);
          addr++;
          if (addr == 0) $finish;
          
      end 

    initial 
      begin
        addr = 6'b000000; 
        $display("ROM Memmory:");
        
      end
endmodule
 
