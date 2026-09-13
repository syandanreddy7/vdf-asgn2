case (state)
	S1: 
		begin
			case (ip)
				2'b00:
					begin 
					next_state = S1;
					op = 2b'01;
					end
				2'b01:
					begin 
					next_state = S1;
					op = 2b'00;
					end
				2'b10:
					begin 
					next_state = S2;
					op = 2b'01;
					end
				2'b11:
					begin 
					next_state = S3;
					op = 2b'00;
					end
				default:
					begin 
					next_state = S1;
					op = 2b'00;
					end
			endcase
		end
	S2: 
		begin
			case (ip)
				2'b00:
					begin 
					next_state = S1;
					op = 2b'11;
					end
				2'b01:
					begin 
					next_state = S3;
					op = 2b'11;
					end
				2'b10:
					begin 
					next_state = S2;
					op = 2b'10;
					end
				2'b11:
					begin 
					next_state = S4;
					op = 2b'10;
					end
				default:
					begin 
					next_state = S1;
					op = 2b'00;
					end
			endcase
		end
	S3: 
		begin
			case (ip)
				2'b00:
					begin 
					next_state = S1;
					op = 2b'00;
					end
				2'b01:
					begin 
					next_state = S5;
					op = 2b'01;
					end
				2'b10:
					begin 
					next_state = S3;
					op = 2b'00;
					end
				2'b11:
					begin 
					next_state = S4;
					op = 2b'00;
					end
				default:
					begin 
					next_state = S1;
					op = 2b'00;
					end
			endcase
		end
	S4: 
		begin
			case (ip)
				2'b00:
					begin 
					next_state = S3;
					op = 2b'11;
					end
				2'b01:
					begin 
					next_state = S5;
					op = 2b'01;
					end
				2'b10:
					begin 
					next_state = S5;
					op = 2b'01;
					end
				2'b11:
					begin 
					next_state = S4;
					op = 2b'11;
					end
				default:
					begin 
					next_state = S1;
					op = 2b'00;
					end
			endcase
		end
	S5: 
		begin
			case (ip)
				2'b00:
					begin 
					next_state = S5;
					op = 2b'00;
					end
				2'b01:
					begin 
					next_state = S1;
					op = 2b'00;
					end
				2'b10:
					begin 
					next_state = S1;
					op = 2b'10;
					end
				2'b11:
					begin 
					next_state = S5;
					op = 2b'11;
					end
				default:
					begin 
					next_state = S1;
					op = 2b'00;
					end
			endcase
		end
endcase	
