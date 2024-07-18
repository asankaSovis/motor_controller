`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Skeptic Studios
// Engineer: Asanka Sovis
// 
// Create Date: 07/18/2024 08:31:53 PM
// Design Name: Motor Controller with active protection
// Module Name: status_indicator
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


module status_indicator(drive_clk, status, motor_green_LED, motor_red_LED);
    input drive_clk, status;
    output motor_green_LED, motor_red_LED;
    
    assign motor_green_LED = !status;
    assign motor_red_LED = status && drive_clk;
endmodule
