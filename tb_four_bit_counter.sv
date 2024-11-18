module tb_four_bit_counter;

    // Testbench signals
    logic clk;
    logic reset;
    logic S;               // Select line (Load control)
    logic [3:0] D;         // Load value
    logic [3:0] q;         // Counter output

    // Instantiate the four_bit_counter
    four_bit_counter uut (
        .S(S),
        .clk(clk),
        .reset(reset),
        .D(D),
        .qout(q)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
//        forever #5 clk = ~clk;  // 10 ns clock period
    #300 $finish;
    end

always 
#5 clk=~clk;

    // Test sequence
    initial begin
        $display("Time\tReset\tS\tD\tQ");
        $display("--------------------------------------");

        // Step 1: Reset the counter
        reset = 0; S = 1; D = 4'h7;  #10 
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        //reset = 0; S = 0; D = 4'h2;  #10 
        //$display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        //reset = 0; S = 0; D = 4'h3;  #10 
        //$display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);

        // Step 2: Let the counter count normally
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);

        // Step 3: Load a custom value (D = 4'b1010)
        S = 1; D = 4'h4; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        S = 0; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);

        // Step 4: Let the counter count from the loaded value
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);

        // Step 5: Reset the counter again
        reset = 1; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);
        reset = 0; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D, q);

        $finish;
    end

endmodule
