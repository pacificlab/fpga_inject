`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
 
(* ALLOW_COMBINATORIAL_LOOPS = "yes" *)
 (* DONT_TOUCH = "yes" *)
module  sensor_carry (
input clk,
input tdl_in,
output [90:1] Q_wire,
output [90:1] CO_wire_del_out
    ); 
    
    reg enable=1;
    wire signal_in;
 

wire [119:0] CO;
wire [90:1] CO_wire_del;
wire [90:1] Q;



assign CO_wire_del = {

CO[119], CO[118], CO[117], CO[116],
CO[115], CO[114], CO[113], CO[112],
CO[111], CO[110], CO[109], CO[108],
CO[107], CO[106], CO[105], CO[104],
CO[103], CO[102], CO[101], CO[100], 
CO[99], CO[98], CO[97], CO[96],
CO[95], CO[94], CO[93], CO[92],
CO[91], CO[90], CO[89], CO[88],
CO[87], CO[86], CO[85], CO[84],
CO[83], CO[82], CO[81], CO[80],
CO[79], CO[78], CO[77], CO[76],
CO[75], CO[74], CO[73], CO[72],
CO[71], CO[70], CO[69], CO[68],
CO[67], CO[66], CO[65], CO[64],
CO[63], CO[62], CO[61], CO[60],
CO[59], CO[58], CO[57], CO[56],
CO[55], CO[54], CO[53], CO[52],
CO[51], CO[50], CO[49], CO[48],
CO[47], CO[46], CO[45], CO[44],
CO[43], CO[42], CO[41], CO[40],
CO[39], CO[35], CO[31], CO[27], CO[23], CO[19], CO[15], CO[11], CO[7], CO[3]
};



assign Q_wire = Q;
assign CO_wire_del_out = CO_wire_del;



// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

// (*BEL="D5FF",LOC="SLICE_X55Y99"*)
  (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst1 (
   .Q(Q[1]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[1])       // 1-bit Data input
);

// End of FDCE_inst instantiation

//(*BEL="A5FF",LOC="SLICE_X55Y99"*)

(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst2 (
   .Q(Q[2]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[2])       // 1-bit Data input
);

// End of FDCE_inst instantiation

(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst3 (
   .Q(Q[3]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[3])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst4 (
   .Q(Q[4]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[4])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst5 (
   .Q(Q[5]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[5])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst6 (
   .Q(Q[6]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[6])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst7 (
   .Q(Q[7]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[7])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst8 (
   .Q(Q[8]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[8])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst9 (
   .Q(Q[9]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[9])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst10 (
   .Q(Q[10]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[10])       // 1-bit Data input
);

// End of FDCE_inst instantiation






// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst11 (
   .Q(Q[11]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[11])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst12 (
   .Q(Q[12]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[12])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst13 (
   .Q(Q[13]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[13])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst14 (
   .Q(Q[14]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[14])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst15 (
   .Q(Q[15]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[15])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst16 (
   .Q(Q[16]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[16])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst17 (
   .Q(Q[17]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[17])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst18 (
   .Q(Q[18]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[18])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst19 (
   .Q(Q[19]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[19])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst20 (
   .Q(Q[20]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[20])       // 1-bit Data input
);

// End of FDCE_inst instantiation






// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst21 (
   .Q(Q[21]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[21])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst22 (
   .Q(Q[22]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[22])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst23 (
   .Q(Q[23]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[23])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst24 (
   .Q(Q[24]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[24])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst25 (
   .Q(Q[25]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[25])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst26 (
   .Q(Q[26]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[26])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst27 (
   .Q(Q[27]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[27])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst28 (
   .Q(Q[28]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[28])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst29 (
   .Q(Q[29]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[29])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst30 (
   .Q(Q[30]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[30])       // 1-bit Data input
);

// End of FDCE_inst instantiation







// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

// (*BEL="D5FF",LOC="SLICE_X55Y99"*)
  (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst31 (
   .Q(Q[31]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[31])       // 1-bit Data input
);

// End of FDCE_inst instantiation

//(*BEL="A5FF",LOC="SLICE_X55Y99"*)

(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst32 (
   .Q(Q[32]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[32])       // 1-bit Data input
);

// End of FDCE_inst instantiation

(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst33 (
   .Q(Q[33]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[33])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst34 (
   .Q(Q[34]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[34])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst35 (
   .Q(Q[35]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[35])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst36 (
   .Q(Q[36]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[36])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst37 (
   .Q(Q[37]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[37])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst38 (
   .Q(Q[38]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[38])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst39 (
   .Q(Q[39]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[39])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst40 (
   .Q(Q[40]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[40])       // 1-bit Data input
);

// End of FDCE_inst instantiation






// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst41 (
   .Q(Q[41]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[41])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst42 (
   .Q(Q[42]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[42])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst43 (
   .Q(Q[43]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[43])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst44 (
   .Q(Q[44]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[44])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst45 (
   .Q(Q[45]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[45])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst46 (
   .Q(Q[46]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[46])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst47 (
   .Q(Q[47]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[47])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst48 (
   .Q(Q[48]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[48])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst49 (
   .Q(Q[49]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[49])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst50 (
   .Q(Q[50]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[50])       // 1-bit Data input
);

// End of FDCE_inst instantiation






// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst51 (
   .Q(Q[51]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[51])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst52 (
   .Q(Q[52]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[52])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst53 (
   .Q(Q[53]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[53])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst54 (
   .Q(Q[54]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[54])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst55 (
   .Q(Q[55]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[55])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst56 (
   .Q(Q[56]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[56])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst57 (
   .Q(Q[57]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[57])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst58 (
   .Q(Q[58]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[58])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst59 (
   .Q(Q[59]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[59])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst60 (
   .Q(Q[60]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[60])       // 1-bit Data input
);

// End of FDCE_inst instantiation





// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

// (*BEL="D5FF",LOC="SLICE_X55Y99"*)
  (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst61 (
   .Q(Q[61]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[61])       // 1-bit Data input
);

// End of FDCE_inst instantiation

//(*BEL="A5FF",LOC="SLICE_X55Y99"*)

(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst62 (
   .Q(Q[62]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[62])       // 1-bit Data input
);

// End of FDCE_inst instantiation

(* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst63 (
   .Q(Q[63]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[63])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst64 (
   .Q(Q[64]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[64])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst65 (
   .Q(Q[65]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[65])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst66 (
   .Q(Q[66]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[66])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst67 (
   .Q(Q[67]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[67])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst68 (
   .Q(Q[68]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[68])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst69 (
   .Q(Q[69]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[69])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst70 (
   .Q(Q[70]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[70])       // 1-bit Data input
);

// End of FDCE_inst instantiation






// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst71 (
   .Q(Q[71]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[71])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst72 (
   .Q(Q[72]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[72])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst73 (
   .Q(Q[73]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[73])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst74 (
   .Q(Q[74]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[74])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst75 (
   .Q(Q[75]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[75])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst76 (
   .Q(Q[76]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[76])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst77 (
   .Q(Q[77]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[77])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst78 (
   .Q(Q[78]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[78])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst79 (
   .Q(Q[79]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[79])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst80 (
   .Q(Q[80]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[80])       // 1-bit Data input
);

// End of FDCE_inst instantiation






// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
//       Clock Enable (posedge clk).
//       7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst81 (
   .Q(Q[81]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[81])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst82 (
   .Q(Q[82]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[82])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst83 (
   .Q(Q[83]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[83])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst84 (
   .Q(Q[84]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[84])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst85 (
   .Q(Q[85]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[85])       // 1-bit Data input
);

// End of FDCE_inst instantiation

 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst86 (
   .Q(Q[86]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[86])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst87 (
   .Q(Q[87]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[87])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst88 (
   .Q(Q[88]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[88])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst89 (
   .Q(Q[89]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[89])       // 1-bit Data input
);

// End of FDCE_inst instantiation


 (* DONT_TOUCH = "yes" *) FDCE #(
   .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDCE_inst90 (
   .Q(Q[90]),      // 1-bit Data output
   .C(clk),      // 1-bit Clock input
   .CE(1),    // 1-bit Clock enable input
   .CLR(0),  // 1-bit Asynchronous clear input
   .D(CO_wire_del[90])       // 1-bit Data input
);

// End of FDCE_inst instantiation




(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst30 (
   .CO({CO[119:116]}),         // 4-bit carry out
  .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[115]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst29 (
   .CO(CO[115:112]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[111]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);


(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst28 (
   .CO(CO[111:108]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[107]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
  .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst27 (
   .CO(CO[107:104]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[103]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst26 (
   .CO({CO[103:100]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[99]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),         // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst25 (
   .CO(CO[99:96]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[95]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
 .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation
 
 
 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst24 (
   .CO(CO[95:92]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[91]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
 .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst23 (
   .CO(CO[91:88]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[87]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst22 (
   .CO({CO[87:84]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[83]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst21 (
   .CO(CO[83:80]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[79]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation
// CARRY4: Fast Carry Logic Component
//         7 Series
// Xilinx HDL Language Template, version 2022.2

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst20 (
   .CO(CO[79:76]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[75]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
  .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst19 (
   .CO(CO[75:72]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[71]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst18(
   .CO({CO[71:68]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[67]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),         // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst17(
   .CO(CO[67:64]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[63]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
 .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation


 
(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst16 (
   .CO(CO[63:60]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[59]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
 .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst15 (
   .CO(CO[59:56]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[55]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst14(
   .CO({CO[55:52]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[51]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

(* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst13(
   .CO(CO[51:48]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[47]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation
// CARRY4: Fast Carry Logic Component
//         7 Series
// Xilinx HDL Language Template, version 2022.2

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst12 (
   .CO(CO[47:44]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[43]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
  .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst11 (
   .CO(CO[43:40]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[39]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);




// End of CARRY4_inst instantiation
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst10(
   .CO({CO[39:36]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[35]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),         // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst9(
   .CO(CO[35:32]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[31]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
 .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation
 
 
  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst8 (
   .CO(CO[31:28]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[27]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
 .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst7 (
   .CO(CO[27:24]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[23]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *)  CARRY4 CARRY4_inst6(
   .CO({CO[23:20]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[19]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst5(
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

 (* DONT_TOUCH = "yes" *)  CARRY4 CARRY4_inst4 (
   .CO(CO[15:12]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[11]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
  .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

  (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst3 (
   .CO(CO[11:8]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[7]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
    .DI({4'b0}),           // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4  CARRY4_inst2(
   .CO({CO[7:4]}),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CO[3]),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({4'b0}),         // 4-bit carry-MUX data in
   .S({enable,enable,enable,enable})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation

 (* DONT_TOUCH = "yes" *) CARRY4 CARRY4_inst1(
   .CO(CO[3:0]),         // 4-bit carry out
   .O(O),           // 4-bit carry chain XOR data out
   .CI(CI),         // 1-bit carry cascade input
   .CYINIT(CYINIT), // 1-bit carry initialization
   .DI({CO[2],CO[1],CO[0], tdl_in}),         // 4-bit carry-MUX data in
   .S({1'b1,1'b1,1'b1,0})            // 4-bit carry-MUX select input
);

// End of CARRY4_inst instantiation
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
 // RAM64X1D: 64 x 1 positive edge write, asynchronous read dual-port
//           distributed RAM (Mapped to a SliceM LUT6)
//           7 Series
// Xilinx HDL Language Template, version 2020.1_versal_lib

////////////////////////////////////////////////////////////////////////////////////////////////////////////////



endmodule



