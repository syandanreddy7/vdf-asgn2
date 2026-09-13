module FSM_Gray_Code(
	

	input [1:0] ip, 
	input clk , rst, 
	output reg [1:0] op
	
	);

// enumerated the gray code into the const variable blocks 
localparam S1 = 3'b000, S2 = 3'b001, S3 = 3'b011, S4 = 3'b010, S5 = 3'b110;

//internal containers to hold/communicate the state and next_state
reg [2:0] state, next_state;


//state register block of code

always @(posedge clk or posedge rst)
	begin
		if (rst)
		begin 
			state <= S1;
		end 
		else
		begin
			state <= next_state; 
		end
	end




always @(*)
	begin 
		next_state = state; 
		op = 2'b00;
		case (state)
			S1: 
				begin
					case (ip)
						2'b00:
							begin 
							next_state = S1;
							op = 2'b01;
							end
						2'b01:
							begin 
							next_state = S1;
							op = 2'b00;
							end
						2'b10:
							begin 
							next_state = S2;
							op = 2'b01;
							end
						2'b11:
							begin 
							next_state = S3;
							op = 2'b00;
							end
					endcase
				end
			S2: 
				begin
					case (ip)
						2'b00:
							begin 
							next_state = S1;
							op = 2'b11;
							end
						2'b01:
							begin 
							next_state = S3;
							op = 2'b11;
							end
						2'b10:
							begin 
							next_state = S2;
							op = 2'b10;
							end
						2'b11:
							begin 
							next_state = S4;
							op = 2'b10;
							end
					endcase
				end
			S3: 
				begin
					case (ip)
						2'b00:
							begin 
							next_state = S1;
							op = 2'b00;
							end
						2'b01:
							begin 
							next_state = S5;
							op = 2'b01;
							end
						2'b10:
							begin 
							next_state = S3;
							op = 2'b00;
							end
						2'b11:
							begin 
							next_state = S4;
							op = 2'b00;
							end
					endcase
				end
			S4: 
				begin
					case (ip)
						2'b00:
							begin 
							next_state = S3;
							op = 2'b11;
							end
						2'b01:
							begin 
							next_state = S5;
							op = 2'b01;
							end
						2'b10:
							begin 
							next_state = S5;
							op = 2'b01;
							end
						2'b11:
							begin 
							next_state = S4;
							op = 2'b11;
							end
					endcase
				end
			S5: 
				begin
					case (ip)
						2'b00:
							begin 
							next_state = S5;
							op = 2'b00;
							end
						2'b01:
							begin 
							next_state = S1;
							op = 2'b00;
							end
						2'b10:
							begin 
							next_state = S1;
							op = 2'b10;
							end
						2'b11:
							begin 
							next_state = S5;
							op = 2'b11;
							end
					endcase
				end
			default:
				begin 
					next_state = S1;
					op = 2'b00;
				end
		endcase	
	end 
endmodule