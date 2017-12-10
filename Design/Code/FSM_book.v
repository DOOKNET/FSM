module FSM_book(
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
			next_state = (din == 0) ? s1 : s0; 
		s1: 
			next_state = (din == 1) ? s2 : s1;
		s2: 
			next_state = (din == 0) ? s3 : s0;
		s3: 
			next_state = (din == 1) ? s0 : s1;
	  	default: ;
	endcase
end

//-----------输出逻辑------------//
reg	out;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		out <= 0;
	end
	else	begin
		case (current_state)
			s0:
				out <= 0;
			s1:
				out <= 0;
			s2:
				out <= 0;
			s3:	
				if(din == 1)	out <= 1;
				else	out <= 0;
		  	default:
			  	out <= 0;
		endcase
	end
end

assign	dout = out;

endmodule 
