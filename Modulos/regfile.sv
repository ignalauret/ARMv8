module regfile
  (input logic clk, we3,
   input logic [4:0] ra1, ra2, wa3,
   input logic [63:0] wd3,
   output logic [63:0] rd1, rd2);

	/*
Nombre del Módulo: regfile
  Puertos de entrada -> 
                          clk: 1 bit
                          we3: 1 bit
                          ra1: 5 bits
                          ra2: 5 bits
                          wa3: 5 bits
                          wd3: 64 bits
  Puertos de salida  ->  
                          rd1: 64 bits
                          ard2: 64 bits


          +------------------+
          |                  |
  ------->| ra1[4:0]         |
          |        rd1[63:0] |-------->
  ------->| ra2[4:0]         |
          |        rd2[63:0] |-------->
          |                  |
          |    REGISTERS     |
          |                  |
  ------->| wa3[4:0]         |
  ------->| wd3[63:0]        |
  ------->| we3              |
          |                  |
          |       clk        |
          +------------------+

*/

  // Init registers in according values.
  logic [63:0] registers [0:31] = '{ 
              64'h0000_0000_0000_0000, 64'h0000_0000_0000_0001, 
              64'h0000_0000_0000_0002, 64'h0000_0000_0000_0003, 
              64'h0000_0000_0000_0004, 64'h0000_0000_0000_0005, 
              64'h0000_0000_0000_0006, 64'h0000_0000_0000_0007, 
              64'h0000_0000_0000_0008, 64'h0000_0000_0000_0009, 
              64'h0000_0000_0000_000A, 64'h0000_0000_0000_000B, 
              64'h0000_0000_0000_000C, 64'h0000_0000_0000_000D, 
              64'h0000_0000_0000_000E, 64'h0000_0000_0000_000F, 
              64'h0000_0000_0000_0010, 64'h0000_0000_0000_0011, 
              64'h0000_0000_0000_0012, 64'h0000_0000_0000_0013, 
              64'h0000_0000_0000_0014, 64'h0000_0000_0000_0015, 
              64'h0000_0000_0000_0016, 64'h0000_0000_0000_0017, 
              64'h0000_0000_0000_0018, 64'h0000_0000_0000_0019, 
              64'h0000_0000_0000_001A, 64'h0000_0000_0000_001B, 
              64'h0000_0000_0000_001C, 64'h0000_0000_0000_001D, 
              64'h0000_0000_0000_001E, 64'h0000_0000_0000_0000 }; 

  always_comb
    begin
      // Register reading
		// If wa3 is one of the reading registers, send the 
		// result (wd3) instead of the actual value of the register.
		if(wa3 != 5'd31 && wa3 == ra1)
			rd1 = wd3;
		else
			rd1 = registers[ra1];
		if(wa3 != 5'd31 && wa3 == ra2)
			rd2 = wd3;
		else
			rd2 = registers[ra2];
    end  

  always_ff @(posedge clk)
    begin
      // Register writing
		// Write wd3 data in wa3 register if we have the correct inputs.
      if (wa3 != 5'd31 && clk && we3) registers[wa3] = wd3;
    end

endmodule


