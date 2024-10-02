module fsm (
    input wire clk,
    input wire data_in,
    input wire reset,
    output reg [3:0] student_id,
    output reg [3:0] current_state
);

// Define the state encoding using an enumerated type equivalent
typedef enum reg [3:0] {s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, 
                        s3 = 4'b0011, s4 = 4'b0100, s5 = 4'b0101,
                        s6 = 4'b0110, s7 = 4'b0111, s8 = 4'b1000} state_type;

reg [3:0] yfsm;  // Current state signal

// State transition process
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        yfsm <= s0;  // Go to initial state if reset is active
    end else begin
        case (yfsm)
            s0: yfsm <= (data_in == 1'b1) ? s1 : s0;
            s1: yfsm <= (data_in == 1'b1) ? s2 : s1;
            s2: yfsm <= (data_in == 1'b1) ? s3 : s2;
            s3: yfsm <= (data_in == 1'b1) ? s4 : s3;
            s4: yfsm <= (data_in == 1'b1) ? s5 : s4;
            s5: yfsm <= (data_in == 1'b1) ? s6 : s5;
            s6: yfsm <= (data_in == 1'b1) ? s7 : s6;
            s7: yfsm <= (data_in == 1'b1) ? s8 : s7;
            s8: yfsm <= (data_in == 1'b1) ? s0 : s8;
            default: yfsm <= s0;  // Default state (in case of error)
        endcase
    end
end

// Output process for student_id and current_state
always @(*) begin
    case (yfsm)
        s0: begin
            student_id = 4'b0101;
            current_state = 4'b0000;
        end
        s1: begin
            student_id = 4'b0000;
            current_state = 4'b0001;
        end
        s2: begin
            student_id = 4'b0001;
            current_state = 4'b0010;
        end
        s3: begin
            student_id = 4'b0001;
            current_state = 4'b0011;
        end
        s4: begin
            student_id = 4'b0101;
            current_state = 4'b0100;
        end
        s5: begin
            student_id = 4'b0010;
            current_state = 4'b0101;
        end
        s6: begin
            student_id = 4'b0000;
            current_state = 4'b0110;
        end
        s7: begin
            student_id = 4'b0100;
            current_state = 4'b0111;
        end
        s8: begin
            student_id = 4'b1000;
            current_state = 4'b1000;
        end
        default: begin
            student_id = 4'b0000;
            current_state = 4'b0000;
        end
    endcase
end

endmodule
