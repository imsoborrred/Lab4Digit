module four_bit_counter(
	input logic S, //select line in diagram Line
	input logic clk,
	input logic reset,
	input logic [3:0] D,
	output logic [3:0] qout

	);
	wire [3:0]y;
	wire [3:0]w;
	wire [3:0] q;
	//wire [3:0] ud; //up+down
	
	assign qout=q;
	assign w[0]=~q[0] ;
	assign w[1]=q[0]^q[1];
	assign w[2]=(q[0]&q[1]) ^ q[2];
	assign w[3]=(q[0]&q[1]&q[2]) ^ q[3] ;
	assign y = S ? D : w;
	
d_flip_flop f1(.data(y[0]),.reset(reset),.q(q[0]),.clk(clk));
d_flip_flop f2(.data(y[1]),.reset(reset),.q(q[1]),.clk(clk));
d_flip_flop f3(.data(y[2]),.reset(reset),.q(q[2]),.clk(clk));
d_flip_flop f4(.data(y[3]),.reset(reset),.q(q[3]),.clk(clk));
    
endmodule
