### Develop Hardware Setup and Test Methodology ###

In the given milestone, the following points should be completed:

- **a.** Physically set up test bed with: NewAE CW305 FPGA board, NewAE ChipWhisperer Husky (for measurements and external voltage glitches)  
- **b.** Implement or adapt existing AES encryption algorithm, Time-to-Digital-Converter (TDC), and include UART such that encryption/decryption messages can be sent  
- **c.** Implement short-circuits and characterize them using the TDC  
- **d.** Create and document test methodology for anticipated fault-injection experiments  
- **e.** Release on GitHub, including code and documentation up to this point  

---

### What was done:

- **a.** The test bed, including the NewAE CW305 FPGA board (Artix-7) and NewAE ChipWhisperer Husky, was set up for subsequent measurement and external voltage glitch experiments. The software for the NewAE ChipWhisperer Husky was tested, implementing a trial AES CPA attack using the ChipWhisperer Husky and Atmel XMEGA 12BD4.  
- **b.** AES encryption algorithm was tested by sending plaintext data and receiving the encrypted message with the specified key.  

  AES Source code: `/firmware/hdl/AES_SC/sources`  

  The Time-to-Digital-Converter (TDC) and UART module were adapted and implemented for the CW305 FPGA board.  

  TDC_SC Source code: `/firmware/hdl/TDC/sources`  

  TDC_SC Vivado archived project: `characterizing_SCs_using_TDC/_Example_WorkFlow_TDC_SC/_sources/_SENSOR_SC_CW305.xpr.zip`  

- **c.** Short-circuits array was implemented in RapidWrite Suite, using `byuccl/short_circuit_aging` library. It was subsequently characterized using the TDC.
  
  Example WorkFlow introduced: `/characterizing_SCs_using_TDC/_Example_WorkFlow_TDC_SC`
  
- **d.** Test methodology was created and documented in `Test_Methodology.md` for anticipated fault-injection experiments.  
- **e.** Code, documentation, and related items were re-released on GitHub.
