module signext_tb();
    logic [31:0] a; 
    logic [63:0] y;

    signext signi(a, y);
  
    initial begin
        #10;
        a = { 11'b111_1100_0010, 9'hCCC, 12'h000 };
        // result most be 0xCC positive
        #10;
        if (y != 8'hCC) $display("Fail on LDUR with %b", a);
        else $display("Success on LDUR");
        #10;
        a = { 11'b111_1100_0000, 9'hFFF, 12'h000 };
        // Result most have negative sign and the 8 less significant bits in 1
        #10;
        if (y[63] != 1 || y[7:0] != 8'hFF) $display("Fail on STUR with %b", a);
        else $display("Success on STUR");
        #10;
        a = { 8'b101_1010_0, 19'h5555, 5'h00 };
        #10;
        if (y != 18'h5555) $display("Fail on CBZ with %b", a);
        else $display("Success on CBZ");
        #10;
        a = { 11'b111_1000_0000, 10'hFFF, 11'h000 };
        #10;
        if (y != 0) $display("Fail on DEFAULT with %b", a);
        else $display("Success on DEFAULT");
        #10;

    end
endmodule
