`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Skeptic Studios
// Engineer: Asanka Sovis
// 
// Create Date: 07/14/2024 05:05:07 PM
// Design Name: Motor Controller with active protection
// Module Name: motor_controller
// Project Name: Motor Controller with active protection
// Target Devices: Cora Z7-0S
// Tool Versions: Vivado 2024.1
// Description: Motor Controller with active protection
// 
// Dependencies: None
// 
// Revision: 0.02
// Revision 0.02 - Motor control finalized
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module motor_controller(int_clk, drive_en, drive_dir, drive_step);

    input int_clk;
    output drive_en, drive_dir;
    output drive_step;
    
    wire drive_clk;
    
    reg state, en, dir;
    
	initial begin
		state <= 1;
		en <= 0;
		dir <= 0;
	end
    
    drive_clock module1 (int_clk, state, drive_clk);
    
    assign drive_step = drive_clk;
    assign drive_en = en;
    assign drive_dir = dir;

endmodule

module drive_clock (int_clk, run, drive_clk);
	
	input int_clk, run;
	output reg drive_clk;
	
	reg [19:0] counter;
	// Drive Speed: b1111,1110,0000,0000,0000 >>> b0000,0010,0000,0000,0000
	reg [19:0] drive_speed = 20'b0000_0010_0000_0000_0000;
	
	initial begin
		counter <= 20'b0000_0000_0000_0000_0000;
	end
	
	always @(posedge int_clk) begin
	
		if (run) begin
			counter <= counter + 20'b0000_0000_0000_0000_0001;
			
			if (counter == drive_speed) begin
				counter <= 20'b0000_0000_0000_0000_0000;
				drive_clk <= ~drive_clk;
			end
		end else begin
			counter <= drive_speed;
			drive_clk <= 0;
			
		end
	
	end

endmodule