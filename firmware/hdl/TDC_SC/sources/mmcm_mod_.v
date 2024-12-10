`timescale 1ns / 1ps

module mmcm_mod_ (

    output tdl_in,     // output clk_out1
    output clk_ps,     // output clk_ps
    // Dynamic phase shift ports
    input psclk, // input psclk
    input psen, // input psen
    input dincr,     // input psincdec
    output psdone,       // output psdone
    // Status and control signals
    input reset, // input reset
    output locked,       // output locked
   // Clock in ports
    input clk_in1     // input clk_in1
);



//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

  clk_wiz_1 mmcm_inst
   (
    // Clock out ports
    .tdl_in(tdl_in),     // output tdl_in
    .clk_ps(clk_ps),     // output clk_ps
    // Dynamic phase shift ports
    .psclk(psclk), // input psclk
    .psen(psen), // input psen
    .psincdec(dincr),     // input psincdec
    .psdone(psdone),       // output psdone
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in1)      // input clk_in1
);

// INST_TAG_END ------ End INSTANTIATION Template ---------


endmodule