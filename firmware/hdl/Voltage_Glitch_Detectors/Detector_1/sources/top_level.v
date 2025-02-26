`timescale 1ns / 1ps


(* DONT_TOUCH = "yes"*)
module top_level(
    input wire clk_in,
    input wire Rx,
    output wire Tx,
    output wire [2:0] lights
    
    
    );

    

   ///////////////////////MMCM ///////////////////

wire psen;
wire dincr;
wire psdone;
wire locked;
wire tdl_in;     
wire clk_ps;

  mmcm_mod_  mmcm_inst
 (
    .tdl_in(tdl_in),     // output clk_out1
    .clk_ps(clk_ps),     // output clk_ps
    // Dynamic phase shift ports
    .psclk(clk_in), // input psclk
    .psen(psen), // input psen
    .dincr(dincr),     // input psincdec
    .psdone(psdone),       // output psdone
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in)      // input clk_in1
);

  assign clk = tdl_in;

       
    
/////////////////////// CALIBRATION ///////////////////


wire [6:0] Q_r_w;
wire [89:0] CO_wire_del_out;
wire [89:0] Q;


detect_block detect_ (
 
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

////// GLITCH DETECTOR LOGIC ////////

reg [6:0] Q_r_w_reg =0;
reg Glitch= 0;

always@(posedge clk) begin
if (Q_r_w <= 15) begin
Q_r_w_reg <= Q_r_w;
Glitch <= 1;
end
end

reg sens_calibr_start;
wire [3:0] state_calibr;

calibr_module calibr_ (
.clk(tdl_in),
.start(sens_calibr_start),
.rstn(reset),
.psen(psen),
.dincr(dincr),
.done(done_calibr),  /// when Qactual = Qnom
.ready(ready),
.Q_r_wire(Q_r_w),
.state(state_calibr)
    );

reg done_calibr_r=0;
reg [3:0]count_r;

always @(posedge clk) begin
    if (done_calibr) begin
        done_calibr_r <= 1;
        count_r <= 0;
    end else if (done_calibr_r) begin
        count_r <= count_r + 1;
        if (count_r == 4) begin // 5 cycles: count_r 0, 1, 2, 3, 4
            done_calibr_r <= 0;
            count_r <= 0;
        end
    end
end


////// UART - AES /////////////////////////////////////
    
    //Define UART tx and rx modules
    wire RxD_data_ready;
    wire RxD_data_error;
    wire RxD_endofpacket;
    wire RxD_idle;
    wire [7:0] RxD_data;
    
    (* DONT_TOUCH = "yes"*)wire enable_sc;
    (* DONT_TOUCH = "yes"*)wire enable_w;
    
    
    async_receiver UART_rec(
        .clk(clk),
        .RxD(Rx),
        .RxD_data_ready(RxD_data_ready),
        .RxD_data_error(RxD_data_error),
        .RxD_endofpacket(RxD_endofpacket),
        .RxD_idle(RxD_idle),
        .RxD_data(RxD_data)
    );
    
    wire TxD_start;
    wire [7:0] TxD_data;
    wire TxD_busy;
    
    async_transmitter UART_transmit(
        .clk(clk),
        .TxD(Tx),
        .TxD_start(TxD_start),
        .TxD_data(TxD_data),
        .TxD_busy(TxD_busy)
    );
    
    // Define AES module
	
	wire load_i; // Start signal
	reg [255:0] key_i = 'h2b7e151628aed2a6abf7158809cf4f3c_00000000000000000000000000000000;
	reg [127:0] data_i;
	reg [1:0] size_i = 0;
	reg dec_i = 0;
	wire [127:0] data_o;
	wire busy_o;
	
	(* DONT_TOUCH = "yes"*) BUFG BUFG_inst_sc(
	   .O(enable_sc),
	   .I(enable_w)
	);
	
	aes_core aes_mod (
	   .clk        (clk),
	   .load_i     (load_i),
	   .key_i      (key_i),
	   .data_i     (data_i),

//       .data_i     (128'h6bc1bee22e409f96e93d7e117393172a),

	   .size_i     (size_i),
	   .dec_i      (dec_i),
	   .data_o     (data_o),
	   .busy_o     (busy_o),
	   .enable_w   (enable_w)

	   
	   
	);
    

    
    parameter IDLE = 0, REC_BYTES = 1,
    SENSOR_CALIBR_START =10,
    SENSOR_CALIBR_DELAY =11,
      AES_START =2, 
      AES_DELAY = 3,
      AES_IDLE = 4, 
      AES_FINISH =5,
        SEND_BYTE =6,
     BYTE_SENDING =7,
       BYTE_WAIT =8,
     SEND_DELAY =9;
    
    
    
    
    
    reg [5:0] ps, ns;
    reg [4:0] send_byte_count, rec_byte_count;
//    reg [143:0] aes_output;
    reg [151:0] aes_output;

    reg TxD_start_reg;
    reg load_i_reg;
    reg [22:0] delay_counter;
    
    assign load_i = load_i_reg;
    assign TxD_start = TxD_start_reg;
    
    assign lights[1:0] = ps[1:0];
    
    // Copy next byte into data_i whenever a byte is received
    always @(posedge RxD_data_ready) begin
        data_i <= data_i << 8;
        data_i [7:0] <= RxD_data;
        if(rec_byte_count == 15) rec_byte_count <= 0;
        else rec_byte_count <= rec_byte_count + 1;
    end
    
    // Output logic: when in state SEND_BYTE, pulse TxD_start
    always @(posedge clk) begin
        case(ps)
          IDLE: begin
                delay_counter <= 0;
                TxD_start_reg <= 0;
            end
            SENSOR_CALIBR_START: begin
            sens_calibr_start <= 1;
            end
            
            SENSOR_CALIBR_DELAY: begin
            sens_calibr_start <= 0;
            end
            
           AES_START: begin
            
                load_i_reg <= 1;
            end
            
           AES_IDLE : load_i_reg <= 0;
           AES_FINISH: 
           begin
   
               aes_output[135:0] <=  {Glitch, Q_r_w_reg, data_o};
                send_byte_count <= 0;
            end
            SEND_BYTE : begin
                TxD_start_reg <= 1;
                send_byte_count <= send_byte_count + 1;
                delay_counter <= 0;
            end
            BYTE_SENDING : aes_output <= aes_output << 8;
            BYTE_WAIT : begin
                TxD_start_reg <= 0;
            end
            SEND_DELAY: delay_counter <= delay_counter + 1;
            default : TxD_start_reg <= 0;
        endcase
    end
    
    
      assign TxD_data = aes_output[151:144];
        
    //Next state logic
    always @(posedge clk) begin
        ps <= ns;
            
        case(ps)
          IDLE: if(rec_byte_count != 0) ns <= REC_BYTES;
            
           REC_BYTES : if(rec_byte_count == 0) ns <= SENSOR_CALIBR_START;
            
           SENSOR_CALIBR_START:  ns <= SENSOR_CALIBR_DELAY ;
           SENSOR_CALIBR_DELAY:        
            begin                                      ///// SENSOR CALIBR START
            if (done_calibr_r)  ns <=  AES_START;
            else  ns <= SENSOR_CALIBR_DELAY;
            end   
            
            AES_START : ns <= AES_DELAY;                  ///// AES START
            AES_DELAY: ns <= AES_IDLE ;
            AES_IDLE : if(busy_o == 0) ns <= AES_FINISH ;
            AES_FINISH : ns <= SEND_BYTE ;
            SEND_BYTE : ns <= BYTE_SENDING;
            BYTE_SENDING: ns <= BYTE_WAIT ;
            
            BYTE_WAIT : begin
                if(TxD_busy == 0) begin
                    if(send_byte_count >= 19) ns <= IDLE;
                    else ns <= SEND_DELAY ;
                end
                else begin
                    ns <= BYTE_WAIT;
                end
            end
            
          SEND_DELAY: begin
                if(delay_counter == 20000) begin
                    if(send_byte_count >= 19) ns <= IDLE;
                    else ns <= SEND_BYTE;
                 end
                else begin
                    if(send_byte_count >= 19) ns <= IDLE;
                    else ns <= SEND_DELAY ;
                end
            end
            default : ns <= IDLE;
        endcase
    end
    
    
    
   
endmodule
