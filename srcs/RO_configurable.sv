`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:52:32 PM
// Design Name: 
// Module Name: RO_configurable
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////
module RO_slice(
    input in_noLatch, in_Latch,
    input sel, bx,
    output out_noLatch, 
    (*dont_touch = "yes"*) output reg out_Latch
    );
    //sel = 1 bypasses latch
    //bx selects inverter group A or B
    
    (*dont_touch = "yes"*) wire muxA_NL, muxA_L, muxB_NL, muxB_L;
    (*dont_touch = "yes"*) reg muxA, muxB, muxFin;
    
    (*dont_touch = "yes"*) not(muxA_NL, in_noLatch);
    (*dont_touch = "yes"*) not(muxA_L, in_Latch);
    (*dont_touch = "yes"*) not(muxB_NL, in_noLatch);
    (*dont_touch = "yes"*) not(muxB_L, in_Latch);
                           
//    (* KEEP, S = "true" *) m21 mux1 (muxA, muxA_NL, muxA_L, sel);
//    (* KEEP, S = "true" *) m21 mux2 (muxB, muxB_NL, muxB_L, sel);
//    (* KEEP, S = "true" *) m21 mux3 (muxFin, muxB, muxA, bx); 

        always_comb begin
            case (sel)
            1: begin muxA = muxA_L; muxB = muxB_L; end
            0: begin muxA = muxA_NL; muxB = muxB_NL; end
            endcase
            
            case (bx)
            1: muxFin = muxA;
            0: muxFin = muxB;
            endcase
        end
    
    (*dont_touch = "yes"*) assign out_noLatch = muxFin;
    
    //(* KEEP, S = "true" *) delay_latch latch (out_Latch, muxFin);
    always@(*) begin
        (*dont_touch = "yes"*) out_Latch = muxFin;
    end
    
endmodule

//module delay_latch(y,x);
//    (*dont_touch = "yes"*) output reg y;
//    (*dont_touch = "yes"*) input x;
    
//        always@(*) begin
//            y = x;
//        end
//endmodule
    
    
//module m21(Y, D0, D1, S);
//    //out, 0 input, 1 input, select
//    output Y;
//    input D0, D1, S;
//    wire T1, T2, Sbar;
    
//    and (T1, D1, S), (T2, D0, Sbar);
//    not (Sbar, S);
//    or (Y, T1, T2);
//endmodule

//module m21(Y, D0, D1, S);
//    //out, 0 input, 1 input, select
//    output reg Y;
//    input D0, D1, S;

//    always @(S) begin
//        case (S)
//            0: Y = D0;
//            1: Y = D1;
//        endcase
//    end
    
//endmodule


module RO_configurable(
    input enable, [2:0]sel, [2:0]bx,
    output flipper
    );
    
    wire out[2:0], outL[2:0];
    reg en_NL, en_L;
    
    RO_slice slice0(en_NL, en_L, sel[0], bx[0], out[0], outL[0]);
    RO_slice slice1(out[0], outL[0], sel[1], bx[1], out[1], outL[1]);
    RO_slice slice2(out[1], outL[1], sel[2], bx[2], out[2], outL[2]);
    
//    m21 mux_enable1 (en_NL, 1'b0, out[2], enable);
//    m21 mux_enable2 (en_L, 1'b0, outL[2], enable);
    
    always_comb begin
        case (enable)
        1: begin en_NL = out[2]; en_L = outL[2]; end
        0: begin en_NL = 0; en_L = 0;end
        endcase
    end
    
    
    assign flipper = out[1];
    
endmodule
