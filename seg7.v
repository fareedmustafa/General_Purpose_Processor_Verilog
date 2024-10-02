module seg7 (
    input wire [3:0] bcd,          // 4-bit input for BCD
    output reg [6:0] leds          // 7-bit output for seven-segment display (abcdefg)
);

// Combinational logic for decoding BCD to seven-segment display
always @(*) begin
    case (bcd)                     // BCD to seven-segment decoder
        4'b0000: leds = 7'b0000001;  // 0
        4'b0001: leds = 7'b1001111;  // 1
        4'b0010: leds = 7'b0010010;  // 2
        4'b0011: leds = 7'b0000110;  // 3
        4'b0100: leds = 7'b1001100;  // 4
        4'b0101: leds = 7'b0100100;  // 5
        4'b0110: leds = 7'b0100000;  // 6
        4'b0111: leds = 7'b0001111;  // 7
        4'b1000: leds = 7'b0000000;  // 8
        4'b1001: leds = 7'b0001100;  // 9
        default: leds = 7'b0110000;  // Default to display 'E' for error
    endcase
end

endmodule
