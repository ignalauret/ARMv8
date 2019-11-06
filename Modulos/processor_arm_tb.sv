module processor_arm_tb();
    logic a;
    processor_arm arm(a);
    
    initial begin
        a = 0;
        #100;
        a = 1;
        #100;
    end
endmodule
