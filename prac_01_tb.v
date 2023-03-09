`timescale 1ns/1ns
module fileoperation_tb;
    reg clk;
    reg we;
    reg [31:0] din;
    reg [4:0] addr;
    wire [31:0] dout;
    fileoperation dut (clk,we,din,addr,dout);
    initial begin
        clk = 1'b0;
        we = 1'b1;
        addr = 5'd0;
        din = 32'd0;
        #100 we = 1'b0;
        #100 addr = 5'd1;
        #110 addr = 5'd2;
        #120 addr = 5'd3;
        #130 addr = 5'd4;
        #140 addr = 5'd5;
        #150 addr = 5'd8;
        #160 addr = 5'd10;
        #180 addr = 5'd13;
        #190 addr = 5'd15;
        #200 addr = 5'd18;
        #210 addr = 5'd20;
    end
    always #50 clk = ~clk;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        $display("The value of data = %0h at memory address = %0d at time %0d",din,addr,$time);
        #2000;
        $finish;
    end
endmodule
