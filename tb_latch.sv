module tb_latch;
    // Declare inputs as `reg` and outputs as `wire`
    reg data, clk;
    wire q1, q2;
    logic reset;
    // Instantiate the D latch module
    Latch uut (
        .data(data),
        .clk(clk),
        .q1(q1),
        .reset(reset),
        .q2(q2)
    );

    // Initial block to apply stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | clk=%b | data=%b | q1=%b | q2=%b", $time, clk, data, q1, q2);

        // Initial values
        clk = 0; data = 0;
        
        // Test sequence
        #10 data = 1; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 1;  reset=1;         // Data changes, Clock Low, no change in q1
        //#10 clk = 1;            // Clock High, q1 should now follow data
        #10 data = 0;           // Data=0, Clock High, q1 should follow data
        //#10 clk = 0;            // Clock Low, q1 holds its value
        #10 $finish;            // End simulation
    end
endmodule
