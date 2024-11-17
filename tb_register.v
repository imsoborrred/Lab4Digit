`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 04:20:18 PM
// Design Name: 
// Module Name: tb_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_register;

    // Declare inputs as `reg` and outputs as `wire`
    reg [3:0] data; 
    reg clk;
    wire [3:0] q;
    reg reset;
    // Instantiate the register module
    register uut (
        .data(data),
        .clk(clk),
        .q(q),
        .reset(reset)
    );

    // Initial block to apply stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | clk=%b | data=%b | q=%b | reset=%b", $time, clk, data, q, reset);

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
        #10 data = 1; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 1;  reset=1;         // Data changes, Clock Low, no change in q1
        //#10 clk = 1;            // Clock High, q1 should now follow data
                //#10 clk = 0;            // Clock Low, q1 holds its value
        #10 data = 1; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 1;  reset=1;         // Data changes, Clock Low, no change in q1
        #10 clk = 1;            // Clock High, q1 should now follow data
                //#10 clk = 0;            // Clock Low, q1 holds its value
        #10 data = 1; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 0;          // Data=0, Clock High, q1 should follow data

        // Test sequence
        #10 data = 12; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 4;  reset=1;         // Data changes, Clock Low, no change in q1
        //#10 clk = 1;            // Clock High, q1 should now follow data
        #10 data = 0;           // Data=0, Clock High, q1 should follow data
        //#10 clk = 0;            // Clock Low, q1 holds its value
        #10 data = 7; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 9; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 1;  reset=1;         // Data changes, Clock Low, no change in q1
        //#10 clk = 1;            // Clock High, q1 should now follow data
                //#10 clk = 0;            // Clock Low, q1 holds its value
        #10 data = 15; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 10;  reset=1;         // Data changes, Clock Low, no change in q1
        #10 clk = 1;            // Clock High, q1 should now follow data
                //#10 clk = 0;            // Clock Low, q1 holds its value
        #10 data = 10; clk = 1; reset=0;  // Data=1, Clock High, q1 should follow data
        #10 data = 8; clk = 0;          // Data=0, Clock High, q1 should follow data
        #10 clk = 0;            // Clock Low, q1 should hold its value
        #10 data = 1;  reset=1;         // Data changes, Clock Low, no change in q1
        //#10 clk = 1;            // Clock High, q1 should now follow data
        #10 $finish;            // End simulation
    end

endmodule
