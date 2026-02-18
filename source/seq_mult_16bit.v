`timescale 1ns / 1ps

module seq_mult_16bit (
    input  wire         clk,        
    input  wire         rst_n,      
    input  wire         start,      
    input  wire [15:0]  a_in,       
    input  wire [15:0]  b_in,       
    output reg  [31:0]  p_out,      
    output reg         done
);


    //the different States
    localparam S_IDLE = 2'b00;
    localparam S_CALC = 2'b01;
    localparam S_DONE = 2'b10;
    

    //internal Registers
    reg [1:0]   state;
    reg [4:0]   count;     
    reg [31:0]  shift_reg;      
    reg [15:0] a_reg;         
    reg        sign_p;   



    wire        a_is_neg;                                 //--
    wire        b_is_neg;                                 //signals for absolute value conversion
    wire [15:0] a_abs;                                    //
    wire [15:0] b_abs;                                    //--
    
    
    
    //adderoutput
    wire [16:0] sum_ext;
    
    

    assign a_is_neg = a_in[15];                      //--
    assign b_is_neg = b_in[15];                      //func1: sign magnitude conversion
    assign a_abs    = a_is_neg ? -a_in : a_in;       //
    assign b_abs    = b_is_neg ? -b_in : b_in;       //--


                                                                        //--
                                                                        //func2: The Adder Logic
    assign sum_ext = {1'b0, shift_reg[31:16]} + {1'b0, a_reg};          //adds multiplicand to upper half of shift register
                                                                        //
                                                                        //--
          
          
    //Sequential State Machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            p_out     <= 0;
            done      <= 0;
            count     <= 0;
            shift_reg <= 0;
            a_reg     <= 0;
            sign_p    <= 0;
            
        end else begin
            case (state)
            
                S_IDLE: begin
                    done <= 0;
                    if (start) begin
                        
                        p_out     <= 0;      //resets/clears the product value for easy tracing on waveform
                        
                        //loadding initial values
                        a_reg     <= a_abs;
                        shift_reg <= {16'd0, b_abs};       //[ 00...00 | multiplier ]
                        sign_p    <= a_is_neg ^ b_is_neg;   //calculate final sign
                        count     <= 0;
                        state     <= S_CALC;
                    end
                end

                S_CALC: begin                                                             //--
                                                                                          //
                    if (shift_reg[0] == 1'b1) begin                                       //performing the 16 iterations
                        shift_reg <= { sum_ext, shift_reg[15:1] };                        // 1.Arithmetic Logic (Add & Shift
                    end else begin                                                        //
                        //bit is 0:just Shift Right                                       //
                        shift_reg <= shift_reg >> 1;                                      //--
                    end

                    //2. Loop Control
                    if (count == 15) begin
                        state <= S_DONE;
                    end else begin
                        count <= count + 1;
                    end
                end

                S_DONE: begin
                
                    //apply the correct sign to the result
                    p_out <= sign_p ? -shift_reg : shift_reg;
                    done  <= 1;       //pulse DONE high
                    state <= S_IDLE;  //return to IDLE
                end
                
                default: state <= S_IDLE;
            endcase
        end
    end

endmodule