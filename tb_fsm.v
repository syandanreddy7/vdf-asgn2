// important point testbench has no ports

module FSM_Gray_Code_tb ();

	reg [1:0] ip_tb;
	reg clk_tb, rst_tb;
	wire [1:0] op_tb;

	FSM_Gray_Code dut(.ip(ip_tb), .clk(clk_tb), .rst(rst_tb), .op(op_tb));

	always #5 clk_tb = ~clk_tb;



	
	initial 
	begin 

		$display("===================================");
		$display("===========STATE COVERAGE==========");
		$display("===================================");
		// intializaing some parameters
		clk_tb = 1'b0;
		rst_tb = 1'b1;
		ip_tb = 2'b00;
		
		//removing the reset / disabling the reset
		#10 
		rst_tb = 1'b0;
		
		// ip_tb = 2'b10;
		// @(posedge clk_tb);
		// #3;
		// if (dut.state == 3'b001 && op_tb == 2'b01)
		// 	begin
		// 		$display("TEST 1: S1 + 10 -> S2 : PASS");
		// 	end
		// else
		// 	begin
		// 		$display("TEST 1: S1 + 10 -> S2 : FAIL");	
		// 	end


		// ip_tb = 2'b01;
		// @(posedge clk_tb);
		// #3;
		// if (dut.state == 3'b011 && op_tb == 2'b11)
		// 	begin
		// 		$display("TEST 2: S2 + 01 -> S3 : PASS");
		// 	end
		// else
		// 	begin
		// 		$display("TEST 2: S2 + 01 -> S3 : FAIL");	
		// 	end

		// ip_tb = 2'b11;
		// @(posedge clk_tb);
		// #3;
		// if (dut.state == 3'b010 && op_tb == 2'b00)
		// 	begin
		// 		$display("TEST 3: S3 + 11 -> S4 : PASS");
		// 	end
		// else
		// 	begin
		// 		$display("TEST 3: S3 + 11 -> S4 : FAIL");	
		// 	end

		// ip_tb = 2'b01;
		// @(posedge clk_tb);
		// #3;
		// if (dut.state == 3'b110 && op_tb == 2'b01)
		// 	begin
		// 		$display("TEST 4: S4 + 01 -> S5 : PASS");
		// 	end
		// else
		// 	begin
		// 		$display("TEST 4: S4 + 01 -> S5 : FAIL");	
		// 	end


		//Resetting the FSM for path 2 traversal

		// rst_tb = 1'b1;
		// #10;
		// rst_tb = 1'b0;

		// $display("===================================");
		// $display("FSM is Reset for Path - 2");
		// $display("===================================");



		check_transition(2'b10, 3'b001, 2'b01);
		check_transition(2'b01, 3'b011, 2'b11);
		check_transition(2'b11, 3'b010, 2'b00);
		check_transition(2'b01, 3'b110, 2'b01);

	end


task check_transition;
	input [1:0] test_ip;
	input [2:0] expected_state;
	input [1:0] expected_op;


	begin
		ip_tb = test_ip;
		#3;
		if(op_tb == expected_op)
		begin
			$display("=======================================");
			$display("TEST : PASS");
			$display("Actual Output : %b , Expected Output : %b",op_tb,expected_op);
		end
		else
		begin
			$display("TEST : FAIL");
			$display("Actual Output : %b , Expected Output : %b",op_tb,expected_op);
		end
		@(posedge clk_tb);
		#3;
		if(dut.state == expected_state)
		begin
			$display("TEST : PASS");
			$display("Actual State : %b , Expected_State : %b",dut.state,expected_state);
		end
		else
		begin
			$display("TEST : FAIL");
			$display("Actual State : %b , Expected_State : %b",dut.state,expected_state);
			$display("=======================================");
		end
	end
endtask 
endmodule