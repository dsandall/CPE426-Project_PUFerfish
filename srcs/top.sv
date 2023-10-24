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
    input BTNC, btnU,
    input CLK,
    output reg [15:0]led, 
    output [3:0]an,
    output [7:0]segs //there are actually 8 cathodes. one is disabled (decimal pt.)
    );
    
    parameter Max_Timer = 80000000;
    wire [15:0]count[8:0]; //9 different 16 bit counts
    reg reset_timer;
    reg [5:0]challenge;
    
    //main control loop for ROs
    //wait for challenge update or reset button, then reset timers
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
    
    assign led[14] = timer_max; //light led 14 when done with RO count
        
//-------
// SHA128 stuff
//-------

    //  sha128_simple ( (ins) CLK, DATA_IN[15:0], RESET, START, 
    //                  (outs)READY, DATA_OUT[127:0]);
    
    reg [127:0]hash;
    wire hash_ready;
    reg [15:0]sseg;
    sha128_simple hash_slinging_slasher(.CLK(CLK), .DATA_IN({challenge,led[7:0]}), .RESET(!timer_max), .START(timer_max), .READY(hash_ready), .DATA_OUT(hash));

    assign led[15] = hash_ready;
   
//--------------
// SSEG Stuff
//--------------

    // based on sw[15:12], display different things to sseg
    always @(*) begin
        case({sw[15],sw[14],sw[13],sw[12]})
            4'd0: sseg = {challenge,led[7:0]};
            4'd1: sseg = hash[15:0];
            4'd2: sseg = hash[31:16];
            4'd3: sseg = hash[47:32];
            4'd4: sseg = hash[63:48];
            4'd5: sseg = hash[79:64];
            4'd6: sseg = hash[95:80];
            4'd7: sseg = hash[111:96];
            4'd8: sseg = hash[127:112];
            default: sseg = 16'd0;
        endcase
    end
    
    //make switches 9->11 act as a RO select, and display their count display when btnU is pressed (mainly for debug, to see margin of error on RO counter)
    int RO_sel;
    assign RO_sel = {sw[11],sw[10],sw[9]}; 
    assign led[11] = sw[11];
    assign led[10] = sw[10];
    assign led[9] = sw[9];
    
    sseg_des my_new_sseg (
        .COUNT( btnU ? count[RO_sel] : sseg),
        .CLK(CLK),
        .VALID(1),
        .DISP_EN({an[0],an[1],an[2],an[3]}),
        .SEGMENTS(segs[7:1]) //IGNORE SEG[0] DECIMAL POINT        
    );
    
endmodule