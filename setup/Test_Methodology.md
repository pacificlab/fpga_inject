## Test Methodology for Fault Injection Experiments
---------------------------------------------------------------------------------------------------------------------------------------
This methodology guides the execution of fault injection experiments: short-circuits (internal faults) and external voltage glitches on the NewAE CW305 FPGA board using the ChipWhisperer Husky.

### Experiment Objectives

The main objective is to conduct a comparative study of fault injection methods by:

* Demonstrating the feasibility of fault injection through short-circuits in FPGAs and showing their superiority for testing purposes by comparing them to traditional (externally generated) voltage glitches.
* Enabling large-scale, per-unit testing of FPGA IP cores via fault injection such that assurance of fully working countermeasures in every device is guaranteed (i.e., to do this in a fully automated way for every device and without external instruments).
* By following this approach, implementing and calibrating glitch detection countermeasures such that they perform better than state-of-the-art countermeasures that are not calibrated on a per-unit basis.
---------------------------------------------------------------------------------------------------------------------------------------
### General Experimental Setup

#### Hardware Components:
- **NewAE CW305 FPGA board (Artix-7 FPGA)** Target for fault injection.
- **ChipWhisperer Husky:** Used for measuring power consumption and injecting external voltage glitches.
- **Laptop:** Controls the ChipWhisperer and communicates with the FPGA via UART.
- **SMA Cables:** For connecting the ChipWhisperer Husky to the x3 SMA port on the CW305 for voltage measurement.
- **UART Interface:** Communication between the laptop and the FPGA for sending/receiving encrypted messages and controlling internal fault injections.
- **AES Encryption Algorithm:** Implemented on the FPGA as the target for fault injection.

#### Setup Connections:
- The ChipWhisperer Husky connects through a 20-pin connector to the CW305 FPGA.
- The ChipWhisperer Husky connects to the x3 SMA port on the CW305 FPGA board to monitor voltage levels.
- The glitch output of the ChipWhisperer Husky connects to the CW305 to inject external glitches.
- The laptop is connected via USB to the ChipWhisperer Husky and via UART to the FPGA for data transmission and command execution.
---------------------------------------------------------------------------------------------------------------------------------------
### Fault Injection Methodology 
---------------------------------------------------------------------------------------------------------------------------------------
### **Unprotected Setup**

#### A. Internal Short-Circuits:

**Setup:** CW305 FPGA, Laptop, UART interface, SC array block, AES module.

***Process***
- **Attack Module:** Use the SC array to induce fault injection in the AES module.
- **Trigger:** Implement a trigger mechanism that induces short-circuits during AES encryption operations.
- **Measurement:** Use the UART for sending encryption/decryption messages.

#### B. External Voltage Glitches:

**Setup:** ChipWhisperer Husky, CW305 FPGA, Laptop, AES module.

***Process***
- **Attack Module:** Use the ChipWhisperer Husky to inject external voltage glitches into the FPGA during critical moments (e.g., during an AES encryption round).
- **Trigger:** Use the ChipWhisperer software on the laptop to control glitch timing, adjusting the duration and intensity of the glitches.
- **Measurement:** The ChipWhisperer Husky records the resulting voltage levels and correlates them with FPGA behavior during the glitch.

### Detection Metrics - Unprotected Setup

- **Percentage of Successful Faults:** Quantify the proportion of faults that successfully disrupt the AES operation.
- **Repeatability:** Assess whether SCs or external glitches produce consistent and reproducible results.
- **Control and Precision:** Measure the ability to fine-tune fault strength, from minimal to catastrophic disruptions, for both methods.
- **Glitch Strength Comparison:** Compare the strength of glitches required to disrupt FPGA operations. Determine if SCs provide more     
  granular control than external voltage glitches.
---------------------------------------------------------------------------------------------------------------------------------------
### **Protected Setup**

#### A. Internal Short-Circuits:

**Setup:** CW305 FPGA, Laptop, UART interface, SC array block, AES module, Voltage Glitch Detector.

***Process***
- **Attack Module:** Use the SC array to induce fault injection in the AES module.
- **Trigger:** Implement a trigger mechanism that induces short-circuits during AES encryption operations.
- **Measurement:** Use the UART for sending encryption/decryption messages.
- **Protected Module:** Use the Voltage Glitch Detector to identify voltage glitches created by the SC array.

#### B. External Voltage Glitches:

**Setup:** ChipWhisperer Husky, CW305 FPGA, Laptop, AES module, Voltage Glitch Detector.

***Process***
- **Attack Module:** Use the ChipWhisperer Husky to inject external voltage glitches into the FPGA during critical moments (e.g., during an AES encryption round).
- **Trigger:** Use the ChipWhisperer software on the laptop to control glitch timing, adjusting the duration and intensity of the glitches.
- **Measurement:** The ChipWhisperer Husky records the resulting voltage levels and correlates them with FPGA behavior during the glitch.
- **Protected Module:** Use the Voltage Glitch Detector to identify voltage glitches created by the ChipWhisperer Husky.

### Detection Metrics - Protected Setup

- **Detection Rate:** Percentage of faults detected.  
  Detection Rate = (TP / (TP + FN)) * 100

- **Precision:** Accuracy of fault detection without false alarms.  
  Precision = (TP / (TP + FP)) * 100

- **Specificity:** True negative rate.  
  Specificity = (TN / (TN + FP)) * 100

- **Accuracy:**  
  Overall accuracy of detection.  
  Accuracy = ((TP + TN) / (TP + TN + FP + FN)) * 100  

  - **TP (True Positives):**  
    Cases where faults were present and correctly detected.  
  - **TN (True Negatives):**  
    Cases where no faults were present and were correctly identified as such.  
  - **FP (False Positives):**  
    Cases where faults were reported but none were present.  
  - **FN (False Negatives):**  
    Cases where faults were present but not detected.  


- **Calibration Potential of Sensors**
  Evaluate the potential of each glitch sensor to be calibrated per unit to account for manufacturing variations.

- **Per-unit Testing Evaluation**
  Assess the potential of the SC method for enabling per-unit testing, which could introduce near 100% assurance that detection mechanisms work (within the limits of the project).

- **Compatibility Across Different FPGA Chips (Optional)**
  Assess the adaptability of the developed test methodologies, including fault injection and detection techniques, for various FPGA platforms.

---------------------------------------------------------------------------------------------------------------------------------------


### Cost Evaluation

1. **External Equipment Costs:** Assess expenses for external equipment.
2. **SC Implementation Costs:** Quantify resources for SC design and implementation.
3. **Overall Cost Comparison:** Evaluate potential long-term savings with SC-based methods.
---------------------------------------------------------------------------------------------------------------------------------------
### Results and Reporting
#### A. Documentation:
- Document hardware setup, test conditions, fault injection results, and key observations.
- Access detection metrics for each method (short-circuits vs. external glitches).
- Summarize advantages and disadvantages of each method.
- Document differences in sensor behavior and provide future recommendations.

#### B. Data Presentation:
- Use graphs and power traces to visually compare short-circuits and glitches.
- Include timing diagrams to show faults and their impact on power consumption and operation.
- Add summary tables comparing key metrics.

#### C. GitHub Status Update:
- Update repository with all results, scripts, and documentation.
---------------------------------------------------------------------------------------------------------------------------------------
This detailed methodology provides insights into the strengths and weaknesses of short-circuit faults versus external voltage glitches, supporting the development of superior fault detection methods.
