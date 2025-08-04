// Code your testbench here
// or browse Examples
module tb_dff_async_reset;
    reg clk, reset, d;
    wire q;

    dff_async_reset uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Test sequence
    initial begin
        $display("Time\tclk\treset\td\tq");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, reset, d, q);

        // Initial conditions
        reset = 1; d = 0; #10;  // Assert reset
        reset = 0; d = 1; #10;  // Load D=1
        d = 0; #10;             // Load D=0
        reset = 1; #7;          // Asynchronous reset in the middle of clock
        reset = 0; d = 1; #10;

        $finish;
    end
endmodule
