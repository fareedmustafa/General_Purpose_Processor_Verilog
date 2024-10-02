module latch (
    input wire [7:0] A,           // 8-bit input A
    input wire Resetn,            // Active-low reset signal
    input wire Clock,             // Clock signal
    output reg [7:0] Q            // 8-bit output Q
);

// Sequential block triggered by Resetn or Clock changes
always @(posedge Clock or negedge Resetn) begin
    // If Resetn is low (active-low), reset the output Q to 0
    if (!Resetn)
        Q <= 8'b00000000;
    // On the rising edge of the clock, latch the value of A into Q
    else
        Q <= A;
end

endmodule
