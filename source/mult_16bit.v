module mult_16bit (
    input wire clk,
    input wire rst_n,
    input wire signed [15:0] a,
    input wire signed [15:0] b,
    output reg signed [31:0] p //the Product is 32-bit (16+16)
);

    reg signed [15:0] a_reg;
    reg signed [15:0] b_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
        
            // Reset values
            a_reg <= 16'sd0;
            b_reg <= 16'sd0;
            p     <= 32'sd0;
            
        end else begin
        
            //Register Inputs
            a_reg <= a;
            b_reg <= b;
            
            //Register Output (Perform Multiplication)
            p <= a_reg * b_reg;
            
        end
    end

endmodule