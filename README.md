# General_Purpose_Processor_Verilog
I created a simple processor as the final project from my Digital Systems course. Originally developed in VHDL, I decided to recreate the project in Verilog after learning it over the summer. This project showcases my understanding and proficiency with Verilog.

We created the components required using combinational and sequential circuits to accomplish this. These components included an Arithmetic and Logical Unit (ALU), two latches, and a control unit comprised of a Finite State Machine (FSM) and a 4:16 decoder to control the states. In the FSM, we utilized Moore's logic. In essence, this processor performs various operations on two 8-bit inputs based on the current state of the FSM and a 16-bit input from the decoder (control unit). The results of these operations were displayed through connected 7-segment displays and observed through waveform analysis.

ALU: The purpose of the ALU is to perform different operations based on the input provided by the FSM and decoder. The inputs of the ALU are the clock, A, B, OP, and Student ID. The ALU changes its operation based on the signal coming from OP. The ALU conducts the operation based on the rising edge of the clock. The outputs of the ALU is Neg, R1 and R2. The R1 output displays the first 4 bits of the 8-bit ALU output and R2 displays the last 4 bits of the ALU output. Together both outputs show the 8-bit output of the ALU The neg output sends a signal to the 7-Segment display when operations require a negative value.

7-segment Display: This 7-segment display converts binary input from the ALU to usable programming for the seven-segment display to operate. The seven-segment display can display values from 0-15 using decimal numbers and hexadecimal values. Also coded for, is the provision for displaying the negative value when needed. For the entirety of the lab, multiple 7-seg displays were used in order to display the ALU results.

4:16 Decoder

The 4:16 decoder is designed to take a 4-bit input signal from the Finite State Machine (FSM) and generate a 16-bit microcode output. When connected to the FSM, this 4:16 decoder plays a crucial role in determining and managing the selection of operations that the "CPU" will execute.

FSM: The FSM in this lab serves the purpose of cycling through the 9 states, it is one part of the control unit or ALU in this lab. This component implements a Moore machine. When a rising edge of the clock and when data-in is enabled the FMS cycles through states S0 to S8. Upon reaching S8, the FSM returns back to S0. The main purpose of this component is to output the change in states to the 4 to 16 decoder, essentially acting like an up counter, which controls the order of each processor operation.

Latch 1 and 2: The latch in this lab is utilized as a storage device that receives the input A and B from the FPGA and stores the values until it clocks at a positive edge. The latches work fundamentally as a D Latch and transfer the input to the output. In order to store both inputs A and B, two identical latches are utilized, with the same code.

![image](https://github.com/user-attachments/assets/fe516e3c-5ccd-46b2-9b89-fc461738f06f)


In summary, the following code resulted in the successful creation of functional components, ultimately culminating in the development of a fully operational general-purpose processor when all the individual parts were integrated.






