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
// Revision: 0.03
// Revision 0.03 - Added LED indication, finalized panic button procedure and relay control
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module motor_controller(int_clk, panic_btn, drive_en, drive_dir, drive_step, din, green_LED, red_LED, motor_green_LED, motor_red_LED, motor_relay);

    input int_clk, panic_btn, din;
    output drive_en, drive_dir, drive_step;
    output green_LED, red_LED, motor_green_LED, motor_red_LED;
    output motor_relay;
    
    wire drive_clk, panic;
    wire [8:0] rx_axgpio;
    
    reg state, en, dir, receiving;
    
	initial begin
		state <= 1;
		en <= 0;
		dir <= 0;
	end
    
    drive_clock module1 (int_clk, state, drive_clk, rx_axgpio[6:0], panic);
    UART_Reciever module2 (int_clk, din, rx_axgpio, green_LED, red_LED, recieving);
    protection_module module3 (panic_btn, panic);
    status_indicator module4 (drive_clk, drive_en, motor_green_LED, motor_red_LED);
    
    assign drive_step = drive_clk;
    assign drive_en = (!(rx_axgpio[6] || rx_axgpio[5] || rx_axgpio[4] || rx_axgpio[3] || rx_axgpio[2] || rx_axgpio[1] || rx_axgpio[0]) || panic);
    assign drive_dir = rx_axgpio[7];
    assign motor_relay = !(panic);

endmodule

module drive_clock (int_clk, run, drive_clk, rx_axgpio, panic_display);
	
	input int_clk, run, panic_display;
	input [6:0] rx_axgpio;
	output reg drive_clk;
	
	reg [25:0] counter;
	reg [12:0] drive_speed_init = 13'b0_0000_0000_0000;
	
	// Drive Speed: b1111,1110,0000,0000,0000 >>> b0000,0010,0000,0000,0000
	wire [25:0] drive_speed;
	
	initial begin
		counter <= 24'b0_0000_0000_0000_0000_0000;
	end
	
	always @(posedge int_clk) begin
	
		if (run) begin
			counter <= counter + 24'b0_0000_0000_0000_0000_0000_0001;
			
			if (counter == drive_speed) begin
				counter <= 24'b0_0000_0000_0000_0000_0000;
				drive_clk <= ~drive_clk;
			end
		end else begin
			counter <= drive_speed;
			drive_clk <= 0;
			
		end
	
	end
	
	assign drive_speed[19] = (rx_axgpio[6] || panic_display);
	assign drive_speed[18] = (rx_axgpio[5] || panic_display);
	assign drive_speed[17] = (rx_axgpio[4] || panic_display);
	assign drive_speed[16] = (rx_axgpio[3] || panic_display);
	assign drive_speed[15] = (rx_axgpio[2] || panic_display);
	assign drive_speed[14] = (rx_axgpio[1] || panic_display);
	assign drive_speed[13] = (rx_axgpio[0] || panic_display);
	assign drive_speed[12:0] = drive_speed_init[12:0];
	assign drive_speed[25] = panic_display;
	assign drive_speed[24] = panic_display;
	assign drive_speed[23] = panic_display;
	assign drive_speed[22] = panic_display;
	assign drive_speed[21] = panic_display;
	assign drive_speed[20] = panic_display;

endmodule