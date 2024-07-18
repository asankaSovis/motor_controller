`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Skeptic Studios
// Engineer: Asanka Sovis
// 
// Create Date: 07/18/2024 09:07:36 PM
// Design Name: Motor Controller with active protection
// Module Name: protection_module
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


module protection_module(panic_btn, panic);

    input panic_btn;
    output panic;

    assign panic = panic_btn;

endmodule
