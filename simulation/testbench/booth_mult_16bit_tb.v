`timescale 1ns/1ps

module booth_mult_16bit_tb;

    //declaring inputs
    reg         clk;
    reg         rst_n;
    reg         start;
    reg [15:0]  a_in;
    reg [15:0]  b_in;

    //outputs
    wire [31:0] p_out;
    wire        done;

    //error counter
    reg [7:0]   error_count;

    //instantiate the unit under test
    booth_mult_16bit DUT (
       .clk(clk),
       .rst_n(rst_n),
       .start(start),
       .a_in(a_in),
       .b_in(b_in),
       .p_out(p_out),
       .done(done)
    );
    

    //clock: 100 MHz
    initial clk = 0;
    always #5 clk = ~clk;

     // initial block for SDF back annotation
   initial begin
      $sdf_annotate("../../synthesis/netlists/booth_mult_16bit.sdf",booth_mult_16bit_tb.DUT, ,"back_annotate.log");
   end


    // ---
    // Comparing Function
    // ---
    function [7:0] compare_outputs (
                                   input signed [31:0]   expected_value,
                                   input signed [31:0]   actual_value,
                                   input [8*19:0] signal_name,
                                   input [7:0]    error_count);
       if (expected_value == actual_value) begin
          $display("  PASS  : %s: Expected = %d, Actual = %d, Time = %t",
                   signal_name, expected_value, actual_value, $time);
          compare_outputs = error_count;
       end else begin
          $display("**FAIL**: %s: Expected = %d, Actual = %d, Time = %t",
                   signal_name, expected_value, actual_value, $time);
          compare_outputs = error_count + 1;
       end
    endfunction



    // --
    // Test Task
    // ---
    task run_case;
       input signed [15:0] a;
       input signed [15:0] b;
       reg   signed [31:0] exp_prod;
       integer i;
       reg case_passed;
       begin
          exp_prod = a * b;
          case_passed = 0;

          //driving inputs at negative edge to ensure setup time
          @(negedge clk);
          a_in  = a;
          b_in  = b;
          start = 1;

          //hold start for 1 cycle
          @(negedge clk);
          #1; 
          start = 0;


          //wait for DONE signal (Timeout Loop)
          for (i = 0; i < 200; i = i + 1) begin
              @(negedge clk);
              #1;                      //wait 1ns after edge to sample 'done'
              if (done === 1'b1) begin
                  case_passed = 1;
                  i = 200;         //break the loop
              end
          end
          
          if (case_passed == 0) begin
              $display("**ERROR**: Timeout waiting for DONE signal.");
              error_count = error_count + 1;
          end else begin
              //verify output
              error_count = compare_outputs(exp_prod, p_out, "p_out    ", error_count);
          end

          $display("--------------------------------------------------");
          #50;
       end
    endtask



    //---
    //main verification process
    //---
    initial begin
       $dumpfile("booth_mult_16bit.vcd");
       $dumpvars(0, booth_mult_16bit_tb);

       error_count = 0;
       rst_n = 0;
       start = 0;
       a_in  = 0;
       b_in  = 0;

       //apply Reset
       #50;
       rst_n = 1;
       #50;



       // ---
       // Test Cases
       // ----
       
       //case 1: simple positive (3 by 2 = 6)
       //booth tests: pattern 00 and 01 transitions
       
       run_case( 16'sd3,    16'sd2);
       
       
       //case 2: positive and negative (10 by -4 = -40)
       //booth tests: handling negative multipliers (strings of 1s)
       
       run_case( 16'sd10,  -16'sd4);
       
       
       //case 3: negative andd negative (-5 by -5 = 25)
       //booth tests: negative times negative
       
       run_case(-16'sd5,   -16'sd5);


       //case 4: max positive and max negative (32767 by -32768)
       // Boundary check
       
       run_case( 16'sd32767, -16'sd32768);


       //case 5: zero multiplication
       run_case( 16'sd20,   16'sd0);
       
       
       // Case 6: Random Large Numbers (Alternating bits 10101...)
       //run_case( 16'sd21845, 16'sd21845);

       
       if (error_count == 0) begin
          $display("\n\n----------SIMULATION PASSED----------");
          $display("----------BOOTH RTL SIMULATION-------\n\n");
       end else begin
          $display("\n\n----------SIMULATION FAILED----------");
          $display("----------BOOTH RTL SIMULATION-------");
          $display("---------- %d ERRORS TOTAL----------\n\n", error_count);
       end

       $finish;
    end

endmodule