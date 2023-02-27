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
            $display("Address %d contains data : %h", addr, data_out);
            addr = addr + 1;
            #10; // wait another 10 units of time
        end
        $finish; // stop simulation
    end

    always #5 clk = ~clk; // toggle clock every 5 units of time


endmodule
