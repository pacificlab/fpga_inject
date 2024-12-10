`timescale 1ns / 1ps
`default_nettype wire

(* DONT_TOUCH = "yes" *)
module calibr_module (
input clk,
input start,
input rstn,
input wire [7:0] Q_r_wire,
output reg psen,
output reg dincr,
output reg done,  
output reg ready, 

output reg [3:0] state
    );
    
reg [3:0] state;   
wire [89:0] CO_wire_del_out;
wire tdl_in;
reg [7:0] Q_r_init;
reg [7:0] Q_r;
reg [7:0] Q_nom = 80;
wire [7:0] Q_r_w;

always@(*)
Q_r = Q_r_wire;

//-- fsm states
localparam IDLE = 0;  //-- Idle state
localparam START = 1;  //-- Start Calibration
localparam INITPHASE_1 = 2;
localparam INITPHASE_2 = 3; 
localparam CONDITIONAL = 4;  
localparam EQUAL = 5;  //-- Idle state
localparam DOWN = 6;
localparam UP = 7; 
localparam DONE = 8; 



//-- Registers for storing the states

reg [3:0] next_state;
reg [32:0] counter;

parameter COUNT_CYCLES = 1300;  // Number of cycles to repeat the action
   
      always @(posedge clk) begin
        if (rstn)
            counter <= 0;
        else if (state == INITPHASE_1) begin
            if (counter < COUNT_CYCLES - 1)
                counter <= counter + 1'b1;
            else
                counter <= 0;
        end else
            counter <= 0;
    end
    

//-- Register the input data
 always @(posedge clk)
   if (state == INITPHASE_2)
     Q_r_init <= Q_r;

always @(posedge clk)
  if (rstn)
    state <= IDLE;
  else
    state <= next_state;

//-- Control signal generation and next states
always @(*) begin

  //-- Default values
  next_state = state;     
  case (state)

    //-- Idle state
    IDLE: begin   ///  Q_r = Q;
    psen = 0;
    dincr = 0;
      done = 0;
      ready = 1;
      if (start == 1)
        next_state = START;
    end

 
    START: begin
    psen = 0;
    dincr = 0;
      done = 0;
      ready = 0;
      next_state = INITPHASE_1;
    end

 INITPHASE_1:   
 begin 
  psen = 1;
    dincr = 1;
      done = 0;
      ready = 0;     
      if (counter == COUNT_CYCLES - 1) begin
                    next_state <= INITPHASE_2;
                end
    end 
    
     INITPHASE_2:   ///// Q_r_init = Q_r;
 begin 
  psen = 0;
    dincr = 0;
      done = 0;
      ready = 0; 
      next_state <= CONDITIONAL;
      end

    CONDITIONAL: begin
    psen = 0;
    dincr = 0;
      ready = 0;
     done = 0;
        next_state = (Q_r_init >= Q_nom) ? ((Q_r_init == Q_nom) ? EQUAL : DOWN) : UP;
    end
    
        EQUAL: begin   ///// Q_r = Q_nom;
        psen = 0;
        dincr = 0;
      ready = 0;
     done = 0;
        next_state = DONE; 
    end
    
        DOWN: begin
        psen = 1;
        dincr = 0;
      ready = 0;
     done = 0;
        next_state = (Q_r > Q_nom) ? DOWN : EQUAL; 
    end
    
     UP: begin
       psen = 1;
       dincr = 1;
     ready = 0;
      done = 0; 
        next_state = (Q_r < Q_nom) ? UP : EQUAL; 
    end
    
    DONE: begin
    psen = 0;
    dincr = 0;
          ready = 0;
          done = 1;
          next_state = IDLE;
          end
          
    
    default: begin
    psen = 0;
    dincr = 0;
      ready = 0;
      done = 0;
      end
      
  endcase
end



endmodule





