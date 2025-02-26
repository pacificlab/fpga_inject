`timescale 1ns / 1ps

(* DONT_TOUCH = "yes" *)
module glitch_detector(
input tdl_in,
input clk_ps, 
output alarm

    );


   wire [19:0] CO;
   reg enable=1;
    wire Q_out1;
    wire Q_out2;  
     reg alarm_reg=0;

(* DONT_TOUCH = "yes" *)
assign Q_inv = !Q_out1;



(* DONT_TOUCH = "yes" *)
assign alarm = alarm_reg;

always@(negedge clk_ps) begin
if (Q_out1  ^ Q_out2) alarm_reg <= 1;
else alarm_reg <= 0;
end




    
   // (*BEL="D5FF",LOC="SLICE_X55Y99"*)
(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst100 (

.Q(Q_out1),
   .C(tdl_in),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(Q_inv)       // 1-bit Data input
); 



    
    
    
      
    // End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst100(
   .CO(CO[3:0]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CI),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({CO[2],CO[1],CO[0], Q_out1}),         // 4-bit carry-MUX data in

   .S({1'b1,1'b1,1'b1,0})            // 4-bit carry-MUX select input
);
    
    
    
 (* DONT_TOUCH = "yes" *) CARRY4  CARRY4_inst101(
   .CO({CO[7:4]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[3]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),         // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation


    
    
    
    // End of CARRY4_inst instantiation

  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst102 (
   .CO(CO[11:8]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[7]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation


 (* DONT_TOUCH = "yes" *)  CARRY4 CARRY4_inst103 (
   .CO(CO[15:12]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[11]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
  .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);
    
    


    
    // End of CARRY4_inst instantiation

  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst104(
   .CO(CO[19:16]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[15]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation
// CARRY4: Fast Carry Logic Component
//         7 Series
// Xilinx HDL Language Template, version 2022.2
     
       // (*BEL="D5FF",LOC="SLICE_X55Y99"*)
(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst102 (
   .Q(Q_out2),      // 1-bit Data output
   .C(clk_ps),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO[19])       // 1-bit Data input
); 
    

    
endmodule

    
    
    
    
    
    
    
 