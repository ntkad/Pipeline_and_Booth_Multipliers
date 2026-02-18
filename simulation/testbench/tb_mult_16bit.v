`timescale 1ns / 1ps

module tb_mult_16bit;

    // Inputs
    reg clk;
    reg rst_n;
    reg signed [15:0] a;
    reg signed [15:0] b;

    // Outputs
    wire signed [31:0] p;

    // Instantiate the DUT
    mult_16bit DUT (
        .clk(clk), 
        .rst_n(rst_n), 
        .a(a), 
        .b(b), 
        .p(p)
    );

    // Clock Generation (10ns period -> 100MHz)
    always #5 clk = ~clk;
    
    // initial block for SDF back annotation
   initial begin
      $sdf_annotate("../../synthesis/netlists/mult_16bit.sdf",tb_mult_16bit.DUT, ,"back_annotate.log");
   end


    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        a = 0;
        b = 0;
        
        // Enable waveform dumping (if needed for viewers like GTKWave)
        $dumpfile("mult_16bit.vcd");
        $dumpvars(0, tb_mult_16bit);

        // Reset the system
        #20;
        rst_n = 1;
        
                                                                             //    TESTCASE 1:
        @(negedge clk); // Align to clock edge                               //    
        a <= 16'sd10;                                                        //
        b <= 16'sd5;                                                         //    *testing simple positve calculation
                                                      
        // Wait 2 cycles for pipeline latency (Input Reg -> Output Reg)      //
        repeat(2) @(negedge clk);     
                                              
        #1; //a smmall delay to read stable output                           //
        $display("Test 1: %d * %d = %d (Expected: 50)", 10, 5, p);           // ---------


                                                                             //    TESTCASE 2:
        @(negedge clk);                                                      //
        a <= 16'sd20;                                                        //
        b <= -16'sd4;                                                        //    *testing a positive by negative multiplication
        
        repeat(2) @(negedge clk);                                            //
        #1;                                                                  //
        $display("Test 2: %d * %d = %d (Expected: -80)", 20, -4, p);         // ---------
            
            
            
                                                                             //    TESTCASE 3:
        @(negedge clk);                                                      //
        a <= -16'sd15;                                                       //
        b <= -16'sd3;                                                        //    *testing a negative by negative multiplication
        
        repeat(2) @(negedge clk);                                            //
        #1;                                                                  //
        $display("Test 3: %d * %d = %d (Expected: 45)", -15, -3, p);         // -----------
        
        
        
                                                                             //    TESTCASE 4:
                                                                             //    32767 * 32767 = 1,073,676,289 (Fits in 32-bit signed)
        @(negedge clk);                                                      //
        a <= 16'sd32767;                                                     // 
        b <= 16'sd32767;                                                     //    *testing the maximum postive range
        
        repeat(2) @(negedge clk);                                            //
        #1;                                                                  //
        $display("Test 4: %d * %d = %d (Expected: 1073676289)", 32767, 32767, p); // ---------

        // Finish Simulation
        #20;
        $finish;
    end
      
endmodule