### SetUp_CW305_ChipWhispHusky 

1. **Thunderbolt** → **CW305**  
   - **Protocol**: UART  
   - **Laptop (USB)** ↔ **CW305 (Pins)**:  
     - **TxD** → **IO1**  
     - **RxD** → **IO2**  

2. **Thunderbolt** → **ChipWhisperer Husky**  
   - **Connection**: USB  

3. **ChipWhisperer Husky** → **CW305**  
   - **Pins**:  
     - **ChipWhisperer Husky (IO4)** ↔ **CW305 (IO4)**  

4. **Laptop** → **Thunderbolt**


### tests_xc7a100t 

The folder presents the results of Mapping and Noise experiments conducted on the Nexys A7-100T FPGA board. 
These experiments are detailed in the paper **Investigating TDC for Hardware Security in FPGAs.**
The paper provides a comprehensive analysis of implementing controllable short-circuit arrays to investigate 
and mitigate malicious hardware activities, including side-channel analysis and voltage fault injection attacks in FPGAs.
The results underscore the effectiveness of SC setups in addressing these security challenges.
