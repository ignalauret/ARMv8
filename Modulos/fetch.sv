module fetch
  #(parameter N = 64)
  (input logic PCSrc_F, clk, reset,
   input logic [N-1:0] PCBranch_F,
   output logic [N-1:0] imem_addr_F);

  logic [N-1:0] pc_in, pc_out, adder_a, adder_b, adder_out;
  flopr #(N) PC(clk, reset, pc_in, pc_out);
  adder #(N) Add(adder_a, adder_b, adder_out);

  always_comb
    begin
      pc_in = PCSrc_F ? PCBranch_F : adder_out;
      adder_a = pc_out;
      adder_b = { {N-3{1'b0}}, 3'b100 };
      imem_addr_F = pc_out;
    end
endmodule

/*
Nombre del Módulo:fetch
  Puertos de entrada
    PCSrc_F: 1 bit
    clk: 1 bit
    reset: 1 bit
    PCBranch_F: 64 bits
  Puertos de salida
    imem_addr_F: 64 bits
*/
