`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
 

(* DONT_TOUCH = "yes" *)
module count_ones (
   input [89:0] Q, 
   input clk,
   output reg [7:0] Q_r    
);

    integer i;
 
    always @(posedge clk) begin
        Q_r = 0;
        for (i = 0; i < 89; i = i + 1) begin
            if (Q[i] == 1'b1)
                Q_r = Q_r + 1'b1;
        end
    end

  

endmodule





