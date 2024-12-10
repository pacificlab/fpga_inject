`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2024 03:48:37 PM
// Design Name: 
// Module Name: top_level
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

(* DONT_TOUCH = "yes"*)
module top_level(
    input wire clk,
    input wire Rx,
    output wire Tx,
    output wire [2:0] lights
    );
    
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
	
	aes_core aes_mod(
	   .clk        (clk),
	   .load_i     (load_i),
	   .key_i      (key_i),
	   .data_i     (data_i),
	   .size_i     (size_i),
	   .dec_i      (dec_i),
	   .data_o     (data_o),
	   .busy_o     (busy_o),
	   .enable_w   (enable_w)
	);
    
    
    /* Module needs to:
            - Wait until it receives start byte
            - Receive next 16 bytes, use them as the message to be encrypted
            - Once they have been stored, send "start" signal to AES module
            - Wait until AES module has finished
            - Send 16 bytes of encrypted message back as a response
    */
    
    /*  000 - IDLE
        001 - REC_BYTES
        010 - AES_START
       1000 - AES_DELAY
        011 - AES_IDLE
        100 - AES_FINISH
        101 - SEND_BYTE
        110 - BYTE_SENDING
        111 - BYTE_WAIT
       1001 - SEND_DELAY
    */
    reg [3:0] ps, ns;
    reg [4:0] send_byte_count, rec_byte_count;
    reg [143:0] aes_output;
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
            4'b0000 : begin
                delay_counter <= 0;
                TxD_start_reg <= 0;
            end
            4'b0010 : begin
                load_i_reg <= 1;
            end
            4'b0011 : load_i_reg <= 0;
            4'b0100 : begin
                aes_output[127:0] <= data_o;
                send_byte_count <= 0;
            end
            4'b0101 : begin
                TxD_start_reg <= 1;
                send_byte_count <= send_byte_count + 1;
                delay_counter <= 0;
            end
            4'b0110 : aes_output <= aes_output << 8;
            4'b0111 : begin
                TxD_start_reg <= 0;
            end
            4'b1001 : delay_counter <= delay_counter + 1;
            default : TxD_start_reg <= 0;
        endcase
    end
    
    assign TxD_data = aes_output[143:136];
    
    //Next state logic
    always @(posedge clk) begin
        ps <= ns;
            
        case(ps)
            4'b0000 : if(rec_byte_count != 0) ns <= 4'b0001;
            4'b0001 : if(rec_byte_count == 0) ns <= 4'b0010;
            4'b0010 : ns <= 4'b1000;
            4'b1000 : ns <= 4'b0011;
            4'b0011 : if(busy_o == 0) ns <= 4'b0100;
            4'b0100 : ns <= 4'b0101;
            4'b0101 : ns <= 4'b0110;
            4'b0110 : ns <= 4'b0111;
            
            4'b0111 : begin
                if(TxD_busy == 0) begin
                    if(send_byte_count >= 18) ns <= 4'b0000;
                    else ns <= 4'b1001;
                end
                else begin
                    ns <= 4'b0111;
                end
            end
            
            4'b1001 : begin
                if(delay_counter == 20000) begin
                    if(send_byte_count >= 18) ns <= 4'b0000;
                    else ns <= 4'b0101;
                 end
                else begin
                    if(send_byte_count >= 18) ns <= 4'b0000;
                    else ns <= 4'b1001;
                end
            end
            default : ns <= 4'b0000;
        endcase
    end
    
    
    
   
endmodule
