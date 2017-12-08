//////////////////////////////////////
//	FPGA第一次授课
//	三段式有限状态机
//	序列检测
//////////////////////////////////////

module FSM(
	input	clk,
	input	rst_n,
	input	din,
	output	dout
);

//----------定义状态------------//
parameter s0 = 4'b0001;
parameter s1 = 4'b0010;
parameter s2 = 4'b0100;
parameter s3 = 4'b1000;

//---------时序逻辑，描述状态转换----------//
reg		[3:0]	current_state;
reg		[3:0]	next_state;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		current_state <= s0;
		next_state <= s0;
	end
	else	begin
		current_state <= next_state;
	end
end


//---------组合逻辑，描述下一状态----------//
always @(current_state or din) begin
	case (current_state)
		s0:
			begin
				if(din == 0)	begin
					next_state <= s1;
				end
				else	begin
					next_state <= s0;
				end
			end
		s1: 
			begin
				if(din == 1)	begin
					next_state <= s2;
				end
				else	begin
					next_state <= s1;
				end
			end
		s2: 
			begin
				if(din == 0)	begin
					next_state <= s3;
				end
				else	begin
					next_state <= s0;
				end
			end
		s3: 
			begin
				if(din == 1)	begin
					next_state <= s0;
				end
				else	begin
					next_state <= s1;
				end
			end
		default: ;
	endcase
end

//-----------输出逻辑---------------//
reg		out = 0;
always @(posedge clk) begin
	case (next_state)
		s0:
			begin
				out <= 0;
			end
		s1:
			begin
				out <= 0;
			end
		s2:
			begin
				out <= 0;
			end
		s3:
			begin
				if(din == 1)	begin
					out <= 1;
				end
				else	begin
					out <= 0;
				end
			end
	  	default: ;
	endcase
end

assign	dout = out;


endmodule

/*
//----------------------------------------//
always @(current_state or din) begin

	case (current_state)
		s0:	begin	next_state = (din == 1)?s0:s1;	end
		s1:	begin	next_state = (din == 1)?s2:s1;	end
		s2:	begin	next_state = (din == 1)?s0:s3;	end
		s3:	begin	next_state = (din == 1)?s2:s1;	end
	  	default: ;
	endcase
end

//-----------------------------------------//
reg		out;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		out <= 0;
	end
	else	begin
		out <= 0;
		case (current_state)
			s0,s1,s2:	out <= 0;
			s3: if(din == 1)	out <= 1;
				else	out <= 0;
		  	default: ;
		endcase
	end
end
assign	dout = out;

endmodule
*/
