`define CLK_TIME 10000                //`CLK_TIMEps is the period of 100Mhz
`define LEN_1 64
`define C_AMO 10

module flopr_tb();
    logic clk, reset;
    logic [`LEN_1 - 1:0] d_1, q_1;
    logic [`LEN_1/2 - 1:0] d_2, q_2;
    bit [`LEN_1 - 1:0] datos [`C_AMO - 1 :0] = {`LEN_1'h1, `LEN_1'h2, `LEN_1'h3, `LEN_1'h4, `LEN_1'h5, 
                                                `LEN_1'h6,  `LEN_1'h7, `LEN_1'h8, `LEN_1'h9, `LEN_1'hA};

    flopr #(`LEN_1)   bugflip(clk, reset, d_1, q_1);
    flopr #(`LEN_1/2) flipi(clk, reset, d_2, q_2);
  
    always
        begin
            clk = ~clk;
            #`CLK_TIME;
        end

    initial begin
        clk = 1;
        reset = 1;
        for(int i = 0; i < `C_AMO/2; i++) begin
          #`CLK_TIME;
          d_1 = datos[i];
          d_2 = datos[i][31:0];
          #`CLK_TIME;
        end
        reset = 0;
        for(int i = 0; i < `C_AMO/2; i++) begin
          #`CLK_TIME;
          d_1 = datos[i];
          d_2 = datos[i][31:0];
          #`CLK_TIME;
        end
        $finish;
    end
endmodule
