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

module motor_controller(int_clk, drive_en, drive_dir, drive_step, din, green_LED, red_LED);

    input int_clk, din;
    output drive_en, drive_dir, drive_step;
    output green_LED, red_LED;
    
    wire drive_clk;
    wire [8:0] rx_axgpio;
    
    reg state, en, dir, receiving;
    
	initial begin
		state <= 1;
		en <= 0;
		dir <= 0;
	end
    
    drive_clock module1 (int_clk, state, drive_clk, rx_axgpio[6:0]);
    UART_Reciever module2 (int_clk, din, rx_axgpio, green_LED, red_LED, recieving);
    
    assign drive_step = drive_clk;
    assign drive_en = en;
    assign drive_dir = rx_axgpio[7];

endmodule

module drive_clock (int_clk, run, drive_clk, rx_axgpio);
	
	input int_clk, run;
	input [6:0] rx_axgpio;
	output reg drive_clk;
	
	reg [19:0] counter;
	reg [12:0] drive_speed_init = 13'b0_0000_0000_0000;
	
	// Drive Speed: b1111,1110,0000,0000,0000 >>> b0000,0010,0000,0000,0000
	wire [19:0] drive_speed;
	
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
	
	assign drive_speed[19:13] = rx_axgpio[6:0];
	assign drive_speed[12:0] = drive_speed_init[12:0];

endmodule