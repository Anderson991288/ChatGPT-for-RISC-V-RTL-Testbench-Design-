# RISC-V-RTL-Testbench-Design


### 用Verilog 建立一個包含16個32位元數值的ROM，總共有32位元的位元寬度

* code :
```
 module rom (
    input        clk,
    input  [4:0] addr,
    output reg [31:0] data_out
);

    reg [31:0] memory [15:0];

    initial begin
        memory[0]  = 32'h00000001;
        memory[1]  = 32'h00000002;
        memory[2]  = 32'h00000003;
        memory[3]  = 32'h00000004;
        memory[4]  = 32'h00000005;
        memory[5]  = 32'h00000006;
        memory[6]  = 32'h00000007;
        memory[7]  = 32'h00000008;
        memory[8]  = 32'h00000009;
        memory[9]  = 32'h0000000A;
        memory[10] = 32'h0000000B;
        memory[11] = 32'h0000000C;
        memory[12] = 32'h0000000D;
        memory[13] = 32'h0000000E;
        memory[14] = 32'h0000000F;
        memory[15] = 32'h00000010;
    end

    always @(posedge clk) begin
        data_out <= memory[addr];
    end

endmodule
```
* testbench :
 ```
module rom_tb;
    reg clk;
    reg [4:0] addr;
    wire [31:0] data_out;

    rom dut (
        .clk(clk),
        .addr(addr),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        addr = 0;
        #10; // wait 10 units of time
        repeat(16) begin // iterate over all addresses
            addr = addr + 1;
            #10; // wait another 10 units of time
        end
        $finish; // stop simulation
    end

    always #5 clk = ~clk; // toggle clock every 5 units of time

    always @(posedge clk) begin
        $display("Address %d contains data : %h", addr, data_out);
    end
endmodule
 ```
