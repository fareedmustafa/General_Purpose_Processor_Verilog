module dec3to8 (
    input wire [2:0] w,    // 3-bit input vector 'w'
    input wire En,         // Enable signal
    output reg [7:0] y     // 8-bit output vector 'y'
);

always @(*) begin
    if (En == 1'b1) begin       // Check if the enable signal is active
        case (w)                // Perform decoding based on input 'w'
            3'b000: y = 8'b10000000;  // If 'w' is 000, set y to 10000000
            3'b001: y = 8'b01000000;  // If 'w' is 001, set y to 01000000
            3'b010: y = 8'b00100000;  // If 'w' is 010, set y to 00100000
            3'b011: y = 8'b00010000;  // If 'w' is 011, set y to 00010000
            3'b100: y = 8'b00001000;  // If 'w' is 100, set y to 00001000
            3'b101: y = 8'b00000100;  // If 'w' is 101, set y to 00000100
            3'b110: y = 8'b00000010;  // If 'w' is 110, set y to 00000010
            3'b111: y = 8'b00000001;  // If 'w' is 111, set y to 00000001
            default: y = 8'b00000000; // Default case (should not happen)
        endcase
    end else begin
        y = 8'b00000000;         // If enable is inactive, output is 00000000
    end
end

endmodule
