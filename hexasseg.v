module hexasseg (
    input wire [3:0] bcd,           // 4-bit input for BCD
    input wire neg,                 // 1-bit input for negative sign
    output reg [6:0] leds,          // 7-bit output for the seven-segment display (abcdefg)
    output reg [6:0] negative       // 7-bit output for the negative sign (abcdefg)
);

// Combinational logic for decoding BCD to seven-segment display
always @(*) begin
    case (bcd)                       // BCD to seven-segment decoder
        4'b0000: leds = 7'b0000001;  // 0
        4'b0001: leds = 7'b1001111;  // 1
        4'b0010: leds = 7'b0010010;  // 2
        4'b0011: leds = 7'b0000110;  // 3
        4'b0100: leds = 7'b1001100;  // 4
        4'b0101: leds = 7'b0100100;  // 5
        4'b0110: leds = 7'b0100000;  // 6
        4'b0111: leds = 7'b0001111;  // 7
        4'b1000: leds = 7'b0000000;  // 8
        4'b1001: leds = 7'b0000100;  // 9
        4'b1010: leds = 7'b0001000;  // A
        4'b1011: leds = 7'b1100000;  // b
        4'b1100: leds = 7'b0110001;  // C
        4'b1101: leds = 7'b1000010;  // D
        4'b1110: leds = 7'b0110000;  // E
        4'b1111: leds = 7'b0111000;  // F
        default: leds = 7'b0110000;  // Error (display E)
    endcase

    // Handling the negative sign
    if (neg == 1'b0) begin
        negative = 7'b1111111;  // No negative sign
    end else begin
        negative = 7'b1111110;  // Display negative sign
    end
end

endmodule
