`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 08:59:24 PM
// Design Name: 
// Module Name: RO
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


module RO(input enable, output out);
    // note: Should probably be rewritten in VHDL instead of using the clunky "dont_touch"
    // works for now?
    
    // dont forget to use the following in constraints, 
    // replacing "testRO/a" with whatever net is given in the error message about timing loops
    //
    // ## Enable Security Wizardry
    // set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets testRO/a]
    (* KEEP, S = "true" *) wire a, b, c, d, e;
    (* KEEP, S = "true" *) nand (b, a, enable);
    (* KEEP, S = "true" *) not(c,b);
    (* KEEP, S = "true" *) not(d,c);
    (* KEEP, S = "true" *) not(e,d);
    (* KEEP, S = "true" *) not(a,e);
    (* KEEP, S = "true" *) not(out,a);
    
endmodule