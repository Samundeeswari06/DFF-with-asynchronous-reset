// Code your design here
module dff_async_reset (
    input clk,
    input reset,   // Asynchronous reset (active high)
    input d,       // D input
    output reg q   // Output
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;     // Reset output immediately
        else
            q <= d;        // Otherwise store D on rising clock edge
    end
endmodule
