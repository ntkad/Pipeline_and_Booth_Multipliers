`timescale 1ns / 1ps

module booth_mult_16bit (
    input  wire         clk,        
    input  wire         rst_n,      
    input  wire         start,      
    input  wire [15:0]  a_in,       
    input  wire [15:0]  b_in,       
    output reg  [31:0]  p_out,      
    output reg          done    
);

    //state Encoding
    localparam S_IDLE = 2'b00;
    localparam S_CALC = 2'b01;
    localparam S_DONE = 2'b10;

    //internal Registers
    reg [1:0]   state;
    reg [4:0]   count;     
    reg [15:0]  m_reg;          
    reg [32:0]  shift_reg;      
    
    //Internal variable for arithmetic
    reg [15:0]  next_sum; 
    reg [1:0]   booth_bits;
    

    //single sequential block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            p_out     <= 0;
            done      <= 0;
            count     <= 0;
            shift_reg <= 0;
            m_reg     <= 0;
        end else begin
            case (state)
                S_IDLE: begin
                    done <= 0;
                    if (start) begin
                        p_out     <= 0;
                        m_reg     <= a_in;
                        
                        //Load: [acc=0 | Multiplier=b_in | Q-1=0]
                        shift_reg <= {16'd0, b_in, 1'b0}; 
                        count     <= 0;
                        state     <= S_CALC;
                    end
                end

                S_CALC: begin
                    //1. read the booth bits
                    booth_bits = shift_reg[1:0];

                    //calculating the "next sum"
                    case (booth_bits)
                        2'b01 : next_sum = shift_reg[32:17] + m_reg; // Add
                        2'b10 : next_sum = shift_reg[32:17] - m_reg; // Sub
                        default: next_sum = shift_reg[32:17];        // No Op
                    endcase

                    //3. perform the Shift
                    //we use next_sum which was just calculated above
                    shift_reg <= {next_sum[15], next_sum, shift_reg[16:1]};

                    //4.loop control
                    if (count == 15) begin
                        state <= S_DONE;
                    end else begin
                        count <= count + 1;
                    end
                end

                S_DONE: begin
                    p_out <= shift_reg[32:1]; 
                    done  <= 1;        
                    state <= S_IDLE;   
                end
                
                default: state <= S_IDLE;
            endcase
        end
    end

endmodule