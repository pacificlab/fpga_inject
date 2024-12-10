`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
 (* DONT_TOUCH = "yes" *)
module top_module (

input clk_in1, 
input Start_calibr_btn, //// START /////
input Rx,
output Tx
 );

  
/////////////////////////////PUSH BTN /////////////////////////////////////////////////////
assign Start_calibr = !Start_calibr_btn ? 1'b1 : 1'b0; 
push_button push5  (.clk(clk_ps),   .pb_1(Start_calibr), .pb_out(Start_new));

  

///////////////////////MMCM CLK ///////////////////

wire psen;
wire dincr;
wire psdone;
wire locked;
wire tdl_in;     
wire clk_ps;



  mmcm_mod_  mmcm_inst
 (
   .tdl_in(tdl_in),     // output clk 1
   .clk_ps(clk_ps),     // output clk 2
    // Dynamic phase shift ports
    .psclk(clk_in1), // input psclk
    .psen(psen), // input psen
    .dincr(dincr),     // input psincdec
    .psdone(psdone),       // output psdone
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in1)      // input clk_in1
);

assign clk = tdl_in;

/////////////////////// SENSOR - CALIBR ///////////////////


wire [7:0] Q_r_w;
wire [89:0] CO_wire_del_out;
wire [89:0] Q;


sensor_carry senss_carry (
 
.clk(clk_ps),
.tdl_in(tdl_in),
.Q_wire(Q),
.CO_wire_del_out(CO_wire_del_out)
    );
        
count_ones counts (   
    .clk(tdl_in),  
        .Q(Q),
    .Q_r(Q_r_w)    
);


calibr_module calibr_ (
.clk(tdl_in),
.start(Start_new),
.rstn(reset),
.psen(psen),
.dincr(dincr),
.done(done_calibr),  /// when Qactual = Qnom
.ready(ready),
.Q_r_wire(Q_r_w),
.state(state_calibr)
    );




/////////////////////// SC ///////////////////


//wire enable;
//(* DONT_TOUCH = "yes" *) reg enable_w;
//(* DONT_TOUCH = "yes" *) wire enable_sc;

//(* DONT_TOUCH = "yes" *) BUFG  BUFG_inst_sc (
//   .O(enable_sc), // 1-bit output: Clock output
//   .I(enable_w)  // 1-bit input: Clock input
//);

//assign enable = Start;

//always @(posedge clk) begin
// if (reset) begin enable_w <= 0;  
// end
// else begin   
//if ( addr_wr_wire == 8 || addr_wr_wire == 28 
//|| addr_wr_wire == 38 || addr_wr_wire == 48 ||addr_wr_wire == 58 
//|| addr_wr_wire == 68 || addr_wr_wire == 78
//  )
// enable_w <= 1;
// else  enable_w <= 0;
// end
// end
 

/////////////////////// MEMM - UART ///////////////////

assign Start = done_calibr;
 

reg UART_done;
wire UART_go;
wire [89:0] mem_data_out;
reg [20:0] counter;
wire Start;
wire [7 : 0] addr_wr_wire;

 (* ALLOW_COMBINATORIAL_LOOPS = "yes" *) mem_control memm_ ( 
 
.clk(clk_ps), .reset( ~reset_out), 
.Start(Start),  ///// AFTER DONE CALIBR;
.UART_done(UART_done),
.data_input(Q),
.data_out (mem_data_out),
.UART_go(UART_go),
.addr_wr_wire(addr_wr_wire),
.state_memm(state_memm),
.addr_rd_wire(addr_rd_wire)

);    

reg[95:0] data;
reg[7:0] tx_data;   

reg [2:0] tx_state;
reg [5:0] cnt, cnt_data;
reg tx_start;
wire tx_ready;
wire o_Tx_Active;
 
 
 

/////////////////////////// UART ///////////////////////////  
  
uart_tx uart_tx_0
  (
   .i_Clock(clk_ps),
   .i_Tx_DV(tx_start),
   .i_Tx_Byte(tx_data), 
   .o_Tx_Active(o_Tx_Active),
   .o_Tx_Serial(Tx),
   .o_Tx_Done()
   );

localparam IDLE =0;
localparam LOAD_0 = 1;
localparam LOAD = 2;
localparam TX = 3;
localparam TX_1 = 4;
localparam TX_2 = 5;

localparam BUSY = 6;


 
always@(posedge clk_ps)  
begin 

    if (reset_out) begin
        tx_data    <= 0;
        data       <= 0; 
        tx_start   <= 0;
        cnt         <=0;
        UART_done  <=0;  
        tx_state    <= IDLE;
    end
    else begin
        tx_start   <= 0;    
        case(tx_state)
        IDLE: begin
            tx_data    <= 0;
            data       <= 0; 
            tx_start   <= 0;
            cnt        <=0;
            UART_done  <=0; 
            if (UART_go) 
               tx_state <= LOAD_0;
        end   
        LOAD_0 : begin
            data    <= 'b0;
            tx_data    <= 0; 
            tx_start   <= 0;
            cnt        <=0;
            UART_done  <=0; 
            tx_state <= LOAD;
              
            end
        LOAD: begin
            data    <= {3'b111,mem_data_out,3'b111};
            tx_data    <= 0; 
            tx_start   <= 0;
            cnt        <=0;
            UART_done  <=0; 
            tx_state <= TX;
              
            end
             
        TX: begin 
        
       if(cnt<12) begin
          cnt <= cnt+1;
            if(o_Tx_Active==0 & !tx_start)begin   
                tx_data  <= data[7:0];   
                data     <= {8'b11111111,data[95:8]};
                tx_start   <= 1;
                tx_state <= TX_1;
                end 
               end
               
                else begin
                    cnt <=0;
                    tx_state <= IDLE;
                    UART_done  <= 1;  
                end   
                     
        end
        
     TX_1: begin
         tx_start <= 0;
       tx_state <= TX_2;
     end
     
        TX_2: begin
       tx_state <= BUSY;
     end
   
        
           
        BUSY:   begin
            if(o_Tx_Active==0)
                tx_state <= TX;
        end  

  
        default:
        begin 
        tx_data     <= 0;
        data        <= 0; 
        tx_start    <= 0;
        cnt         <=0;
        UART_done   <=0;  
        tx_state    <= IDLE;
        
        end 
        endcase
        
    end
end



endmodule
