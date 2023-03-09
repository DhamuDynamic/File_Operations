module fileoperation (clk,we,din,addr,dout);
    input clk;
    input we;
    input [31:0] din;
    input [4:0] addr;
    output reg [31:0] dout;
    reg [31:0] Mem [0:25];
    initial begin
        $readmemh("coeff.txt",Mem,0,25);
    end
    always @(posedge clk) begin
        if(we)
        Mem[addr] <= din;
        else
        dout <= Mem[addr];
    end
endmodule