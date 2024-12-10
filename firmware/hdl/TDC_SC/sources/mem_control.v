`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////



(* DONT_TOUCH = "yes" *)
module mem_control (

input wire clk,reset, 
input wire Start,   ///// START -> WRITE;
input wire UART_done,
input wire [89:0] data_input,
output wire [89:0] data_out,
output reg UART_go,
output [7:0] addr_wr_wire,
output [2:0] state_memm,
output  [7:0] addr_rd_wire
    );



wire [89:0] data_input_mem; 
reg ena, c;
wire [7 : 0] addr; 
reg [7 : 0] addr_wr=0; 
reg [7 : 0] addr_rd=0; 
reg wr_rd; 
reg wea;

assign addr_rd_wire = addr_rd;
assign addr_wr_wire = addr_wr;
assign data_input_mem = (wr_rd) ? data_input : 0;


assign addr = (wr_rd)? addr_wr : addr_rd; ///// wr_rd = 1; - write; wr_rd = 0; - read;




//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
blk_mem_gen_1 memm_block (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addr),  // input wire [7 : 0] addra
  .dina(data_input_mem),    // input wire [89 : 0] dina
  .douta(data_out)  // output wire [89 : 0] douta
);
// INST_TAG_END ------ End INSTANTIATION Template ---------




localparam IDLE = 1;
localparam WRITE= 2; 
localparam INTER_D= 3;
localparam INTER_DD= 4;
localparam INTER= 5;
localparam READ = 6;
localparam TRANS= 7;


reg [2:0] state, next_state; 
assign state_memm = state;

always@(posedge clk)
begin 
    if(~reset)
    begin 
        state <= 2'b0; 
    end 
    else 
    begin  
        state <= next_state; 
    end 
end

reg addr_up; 
reg addr_clr;

always@(posedge clk)
begin 
    if(~reset)
    begin 
        addr_wr <= 'b0; 
    end 
    else 
    begin  
        if(wr_rd & ena) addr_wr <= addr_wr + 1; 
        else if(addr_clr) addr_wr <= 0; 
    end  
end

always@(posedge clk)
begin 
    if(~reset)
    begin 
        addr_rd <= 'b0; 
    end 
    else 
    begin  
        if(~wr_rd & ena) addr_rd <= addr_rd + 1; 
        else if(addr_clr) addr_rd <= 0;  
    end  
end  

always@*
begin 
   case(state)
    IDLE:
    begin 
        ena <= 'b0; 
        wea <= 'b0; 
        wr_rd <= 'b0; 
        UART_go <= 1'b0;
        addr_clr <= 1'b1;
        if(Start) next_state <= WRITE; 
        else next_state <= IDLE; 
    end
    WRITE:
    begin 
        ena <= 'b1; 
        wea <= 'b1; 
        wr_rd <= 1'b1; 
        UART_go <= 1'b0;
        addr_clr <= 1'b0;
        if(addr_wr == 100)   next_state <= INTER_D; 
        else next_state <= WRITE; 
    
    end  
    INTER_D: 
    begin  
        ena <= 'b0; 
        wea <= 'b0; 
        wr_rd <= 1'b0; 
        UART_go <= 1'b0;  
        addr_clr <= 1'b0;
        next_state <= INTER_DD;  
    end 
    INTER_DD: 
    begin  
        ena <= 'b0; 
        wea <= 'b0; 
        wr_rd <= 1'b0; 
        UART_go <= 1'b0; 
        addr_clr <= 1'b0; 
        next_state <= INTER;  
    end 
    INTER: 
    begin  
        ena <= 'b0; 
        wea <= 'b0; 
        wr_rd <= 1'b0; 
        UART_go <= 1'b0; 
        addr_clr <= 1'b0;
        
        next_state <= READ; 
 
    end 
    
    READ: 
    begin  
        ena <= 'b1; 
        wea <= 'b0; 
        wr_rd <= 1'b0; 
        UART_go <= 1'b0; 
        addr_clr <= 1'b0;
        next_state <= TRANS; 
    
    
    end 
     
    TRANS: 
    begin  
        ena <= 'b0; 
        wea <= 'b0; 
        wr_rd <= 1'b0; 
        UART_go <= 1'b1; 
        addr_clr <= 1'b0;
        if(UART_done & (addr_rd == 100))   next_state <= IDLE;  
        else if (UART_done & (addr_rd < 100))   next_state <= READ; 
        else next_state <= TRANS; 
    end  

    
    default :
    begin 
        ena <= 'b0; 
        wea <= 'b0; 
        wr_rd <= 1'b0; 
        UART_go <= 1'b0; 
        next_state <= IDLE;  
    
    
    end
    endcase
end


endmodule