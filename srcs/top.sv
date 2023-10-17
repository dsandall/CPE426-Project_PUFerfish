`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2015 12:33:28 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input [15:0]sw,
    input CLK,
    output [15:0]led, 
    output [3:0]an,
    output [7:0]segs //there are actually 8 cathodes. one is disabled (decimal pt.)
    );
    parameter Max_PRI = 150000;
    parameter Max_SSEG = 9999;
    reg ledToggle;
    wire pri_max, sec_max;
    wire [15:0] sec_count;

    RO testRO(sw[15], osc);
    counter #(.max(Max_PRI)) priCounter (.up(osc), .rst(sw[14]), .at_max(pri_max));
    counter #(.max(Max_SSEG)) secCounter (.up(pri_max), .rst(sw[14]), .count(sec_count), .at_max(sec_max));
    
    //toggle the LED when secondary counter reaches max
    initial begin ledToggle <=0; end
    always @(posedge sec_max) ledToggle = ~ledToggle;
    
    assign led[4:0] = sw[4:0]; //assign some switches to some LEDs, for sanity
    assign led[15] = ledToggle; //assign one LED to the RO's counter
    
    
//--------------
// SSEG Stuff
//--------------

      univ_sseg my_univ_sseg (
         .cnt1    (sec_count), 
//         .cnt1    (14'd2),
         .cnt2    (7'b0), 
         .valid   (1'b1), 
         .dp_en   (1'b0), 
         .dp_sel  (2'b00), 
         .mod_sel (2'b10), 
         .sign    (1'b0), 
         .clk     (CLK), 
         .ssegs   (segs), 
         .disp_en (an)    ); 

endmodule
