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
module RO_withCounter (input enable, reset, [2:0]sel, [2:0]bx, output [15:0] count);
    //we put the counter inside the RO module, to simplify the controls design outside the module
    //a shortcut, yes, but a worthy one
    
    parameter Max_PRI = 4096; //increase to reduce sensitivity and jitters - this seems to be ok, but we have not tested different temperatures
    parameter Max_SSEG = 16'hFFFF; //hard max, if you want to display the count on the SSEG. could be lower, but why?
    
    // at  bx = sel = 0, and 150k x 5k cycles, it takes 5.5 seconds to toggle LED - this puts RO frequency at ~135 MHz
    RO_configurable RO(enable, sel, bx, osc);
    
    //RO testRO(sw[15], osc); //old simple RO. for loserz only 
    counter #(.max(Max_PRI)) priCounter (.up(osc), .rst(reset), .at_max(pri_max)); //initial clock divider - higher numbers will "smooth out" jitters, while lower numbers will increase sensitivity to RO differences
    counter #(.max(Max_SSEG)) secCounter (.up(pri_max), .rst(reset), .count(count), .at_max()); //pulse counter - output goes to SSEG display
endmodule

module top(
    input [15:0]sw,
    input BTNC,
    input CLK,
    output reg [15:0]led, 
    output [3:0]an,
    output [7:0]segs //there are actually 8 cathodes. one is disabled (decimal pt.)
    );
    parameter Max_Timer = 80000000;
    wire [15:0]count[8:0]; //9 different 16 bit counts
    reg reset_timer;
    reg [5:0]challenge;
    int RO_sel;
    
    always @(posedge CLK, posedge BTNC) begin
        if (challenge != {sw[5:3],sw[2:0]}) begin
            challenge = {sw[5:3],sw[2:0]};
            reset_timer = 1;
        end
        else if (BTNC) reset_timer = 1;
        else reset_timer = 0;
    end

    counter #(.max(Max_Timer), .autoreset(0)) timerCounter (.up(CLK), .rst(reset_timer), .at_max(timer_max)); //clock timer - consistent, ensures that each RO (and each config is measured for the same amount of time
    
    (*dont_touch = "yes"*) RO_withCounter RO_0 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[0][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_1 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[1][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_2 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[2][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_3 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[3][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_4 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[4][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_5 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[5][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_6 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[6][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_7 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[7][15:0]));
    (*dont_touch = "yes"*) RO_withCounter RO_8 (.enable(!timer_max), .reset(reset_timer), .sel(challenge[5:3]), .bx(challenge[2:0]), .count(count[8][15:0]));
    
    //only update leds when timer is done, otherwise slight flicker occurs during transitions
    always @(posedge timer_max) begin
        led[0] = count[0]>count[1];
        led[1] = count[1]>count[2];
        led[2] = count[2]>count[3];
        led[3] = count[3]>count[4];
        led[4] = count[4]>count[5];
        led[5] = count[5]>count[6];
        led[6] = count[6]>count[7];
        led[7] = count[7]>count[8];
    end
    
    assign led[14] = timer_max; //light led 14 when done
    
    assign RO_sel = 4*sw[11] + 2*sw[10] + sw[9]; //make switches 9->11 act as a RO count display select
    assign led[11] = sw[11];
    assign led[10] = sw[10];
    assign led[9] = sw[9];

       
//--------------
// SSEG Stuff
//--------------
    sseg_des my_new_sseg (
        .COUNT( sw[15] ? {challenge,led[7:0]} : count[RO_sel] ),
        .CLK(CLK),
        .VALID(1),
        .DISP_EN({an[0],an[1],an[2],an[3]}),
        .SEGMENTS(segs[7:1]) //IGNORE SEG[0] DECIMAL POINT        
    );
endmodule