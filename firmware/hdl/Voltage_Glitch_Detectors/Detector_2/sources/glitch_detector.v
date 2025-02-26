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

assign alarm = !Q_out2;

    
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
    
      
    // End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst100(
   .CO(CO[3:0]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CI),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({CO[2],CO[1],CO[0], tdl_in}),         // 4-bit carry-MUX data in

   .S({1'b1,1'b1,1'b1,0})            // 4-bit carry-MUX select input
);
    
    // End of CARRY4_inst instantiation   
    
 (* DONT_TOUCH = "yes" *) CARRY4  CARRY4_inst101(
   .CO({CO[7:4]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[3]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),         // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);


  
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

    
    
    
    
    
    
    
    
    /////    CONFIGURABLE DELAY LINE ///////


//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst130 (
//   .CO({CO[119:116]}),         // 4-bit carry out
//  .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[115]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst129 (
//   .CO(CO[115:112]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[111]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);


//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst128 (
//   .CO(CO[111:108]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[107]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//  .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst127 (
//   .CO(CO[107:104]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[103]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst126 (
//   .CO({CO[103:100]}),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[99]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),         // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst125 (
//   .CO(CO[99:96]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[95]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
// .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation
 
 
// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst124 (
//   .CO(CO[95:92]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[91]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
// .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst123 (
//   .CO(CO[91:88]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[87]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst122 (
//   .CO({CO[87:84]}),         // 4-bit carry1 out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[83]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst121 (
//   .CO(CO[83:80]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[79]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation
//// CARRY4: Fast Carry Logic Component
////         7 Series
//// Xilinx HDL Language Template, version 2022.2

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst120 (
//   .CO(CO[79:76]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[75]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst119 (
//   .CO(CO[75:72]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[71]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst118(
//   .CO({CO[71:68]}),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[67]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),         // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst117(
//   .CO(CO[67:64]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[63]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
// .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation


 
//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst116 (
//   .CO(CO[63:60]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[59]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
// .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst115 (
//   .CO(CO[59:56]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[55]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst114(
//   .CO({CO[55:52]}),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[51]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

//(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst113(
//   .CO(CO[51:48]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[47]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation
//// CARRY4: Fast Carry Logic Component
////         7 Series
//// Xilinx HDL Language Template, version 2022.2

// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst112 (
//   .CO(CO[47:44]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[43]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//  .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst111 (
//   .CO(CO[43:40]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[39]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);




//// End of CARRY4_inst instantiation
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst110(
//   .CO({CO[39:36]}),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[35]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),         // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst109(
//   .CO(CO[35:32]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[31]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
// .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation
 
 
//  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst108 (
//   .CO(CO[31:28]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[27]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
// .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

// (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst107 (
//   .CO(CO[27:24]),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[23]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//   .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

// (* DONT_TOUCH = "yes" *)  CARRY4 CARRY4_inst106(
//   .CO({CO[23:20]}),         // 4-bit carry out
//   .O(O),           // 4-bit carry chain XOR data out
//   .CI(CO[19]),         // 1-bit carry cascade input
//   .CYINIT(CYINIT), // 1-bit carry initialization
//    .DI({4'b0}),           // 4-bit carry-MUX data in
//   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
//);

//// End of CARRY4_inst instantiation

   
    
 
    

    
    
endmodule
