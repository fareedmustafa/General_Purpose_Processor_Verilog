module ALU (
    input wire Clk,
    input wire [7:0] A, B,             // 8-bit inputs A and B
    input wire [3:0] student_id,       // 4-bit student_id input (unused in logic)
    input wire [15:0] OP,              // 16-bit operation code input
    output reg Neg,                    // Negative flag output
    output reg [3:0] R1, R2            // 4-bit outputs R1 and R2
);

// Internal signals
reg [7:0] Reg1, Reg2, Result;         // 8-bit registers to hold input and result

// Register assignments (equivalent to signal assignments in VHDL)
always @(*) begin
    Reg1 = A;
    Reg2 = B;
end

// ALU operations
always @(posedge Clk) begin
    case (OP)
        16'b0000000000000001: Result = Reg1 + Reg2;               // Addition
        16'b0000000000000010: begin                               // Subtraction with Neg flag
            if (Reg2 > Reg1) begin
                Result = Reg1 + (~Reg2 + 1);                      // Two's complement subtraction (Reg1 - Reg2)
                Neg = 1'b1;
            end else begin
                Result = Reg1 - Reg2;
                Neg = 1'b0;
            end
        end
        16'b0000000000000100: begin                               // NOT operation on Reg1
            Result = ~Reg1;
            Neg = 1'b0;
        end
        16'b0000000000001000: begin                               // NOR operation
            Result = ~(Reg1 & Reg2);
            Neg = 1'b0;
        end
        16'b0000000000010000: begin                               // NOR operation
            Result = ~(Reg1 | Reg2);
            Neg = 1'b0;
        end
        16'b0000000000100000: begin                               // AND operation
            Result = Reg1 & Reg2;
            Neg = 1'b0;
        end
        16'b0000000001000000: begin                               // OR operation
            Result = Reg1 | Reg2;
            Neg = 1'b0;
        end
        16'b0000000010000000: begin                               // XOR operation
            Result = Reg1 ^ Reg2;
            Neg = 1'b0;
        end
        16'b0000000100000000: begin                               // XNOR operation
            Result = ~(Reg1 ^ Reg2);
            Neg = 1'b0;
        end
        default: Result = 8'b00000000;                            // Default case (result invalid or empty)
    endcase
end

// Assign 4-bit portions of the result to R1 and R2
always @(*) begin
    R1 = Result[3:0];    // Lower 4 bits
    R2 = Result[7:4];    // Upper 4 bits
end

endmodule
