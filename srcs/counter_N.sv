`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 01:45:36 PM
// Design Name: 
// Module Name: counter_N
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


//module counter #(parameter max = 7999)(
//    input up,
//    input rst,
//    output integer unsigned count, 
//    output reg at_max
//    );
   
//    initial count = 0;
    
//    always @(posedge up, posedge rst) begin
//        at_max <= 0;
//        if (rst) count <= 0;
//        else if (count < max) count <= count + 1;
//        else begin
//            count <= 0; // count == max
//            at_max <= 1;
//        end
//    end
      
//endmodule

module counter #(parameter max = 8, parameter autoreset = 1)(
    input up,
    input rst,
    output integer unsigned count, 
    output reg at_max
    );
   
    initial count = 0;
    initial at_max = 0;
    
    always @(posedge up, posedge rst) begin
        if (rst) begin 
            count <= 0; 
            at_max <= 0; 
            end
        else if (count < max) begin 
            at_max <= 0; 
            count <= count + 1; 
            end
        else if (!autoreset) begin
            //no autoreset, at max
            at_max <= 1;
            end
        else begin
            //yes autoreset, also at max
            at_max <= 1;    
            count <= 0;        
            end
    end
      
endmodule
