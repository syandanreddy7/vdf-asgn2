// important point testbench has no ports

module FSM_Gray_Code_tb ();

	reg [1:0] ip_tb;
	reg clk_tb, rst_tb;
	wire [1:0] op_tb;

	FSM_Gray_Code dut(.ip(ip_tb), .clk(clk_tb), .rst(rst_tb), .op(op_tb));

	always #5 clk_tb = ~clk_tb;

	initial 
	begin 
		clk_tb = 1'b0;
		rst_tb = 1'b1;
		ip_tb = 2'b00;
		#10 
		rst_tb = 1'b0;
		ip_tb = 2'b10;

		@(posedge clk_tb);
		#3;
		if (dut.state == 3'b001 && op_tb == 2'b01)
			begin
				$display("TEST 1: S1 + 10 -> S2 : PASS");
			end
		else
			begin
				$display("TEST 1: S1 + 10 -> S2 : FAIL");	
			end

		ip_tb = 2'b01;
		@(posedge clk_tb);
		#3;
		if (dut.state == 3'b011 && op_tb == 2'b11)
			begin
				$display("TEST 2: S2 + 01 -> S3 : PASS");
			end
		else
			begin
				$display("TEST 2: S2 + 01 -> S3 : FAIL");	
			end

		ip_tb = 2'b11;
		@(posedge clk_tb);
		#3;
		if (dut.state == 3'b010 && op_tb == 2'b00)
			begin
				$display("TEST 3: S3 + 11 -> S4 : PASS");
			end
		else
			begin
				$display("TEST 3: S3 + 11 -> S4 : FAIL");	
			end

		ip_tb = 2'b01;
		@(posedge clk_tb);
		#3;
		if (dut.state == 3'b110 && op_tb == 2'b01)
			begin
				$display("TEST 4: S4 + 01 -> S5 : PASS");
			end
		else
			begin
				$display("TEST 4: S4 + 01 -> S5 : FAIL");	
			end


		//Resetting the FSM for path 2 traversal

		



	end

endmodule