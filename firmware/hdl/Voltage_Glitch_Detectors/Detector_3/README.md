## Glitch Detector with Two Clocks and XOR Gate  


### Main Components

The main components of the given sensor, as shown in [**Fig. 1**](#fig1), include a **configurable delay line** consisting of **Carry 4 delay elements** (Artix-7), a **Mixed-Mode Clock Manager (MMCM)** module from **Xilinx Vivado**, **Two registers (flip-flops)** , and **an XOR gate** for glitch detection.

#### Fig. 1
## <a name="fig1"></a>
![Fig. 1: Voltage Glitch Detector](Schematic_Detector_3.png)

### Featured Characteristics  

The detector was implemented due to the features of the sensor, particularly its ability to **utilize two clocks** that can be configured with varying phase shifts relative to each other. The **phase shift capability of the MMCM** is leveraged for fine-tuning during the calibration phase.  

### Working Process Flow  

The detector operates through the following steps:  

1. **Determining the Required SCs**  
   - Identify the minimum number of **short-circuits (SCs)** needed for a successful glitch.  

2. **Calibrating the Sensor**  
   - Adjust the **phase shift** between the **two clock signals** that drive the corresponding flip-flops (FFs).  
   - The output of the first FF is **inverted and fed back to the input (D)**, causing it to oscillate and **continuously apply a delayed signal** to the second FF.  

3. **Glitch Detection via XOR Gate**  
   - The outputs of both FFs are fed into an XOR gate.  
   - By **monitoring the XOR output**, we detect the presence of a glitch when an alarm signal is triggered.  

By leveraging two independent clock signals, the sensor can be **precisely calibrated** while remaining unaffected by **manufacturing variations in delay elements**.  

### Conducted Experiments  

The layout of the sensor and AES module is shown in [**Fig. 2**](#fig2), and the layout of the setup with the SC array is depicted in [**Fig. 3**](#fig2). The thorough map of experiments is provided in `/Voltage_Glitch_Detectors/Test_Calibration_Map.xlsx`.

#### Fig. 2, 3
## <a name="fig2"></a>
<div style="display: flex; justify-content: space-around;">
  <img src="Layout_Detector_3.png" alt="Voltage Glitch Detector" style="max-width: 45%; margin-right: 10px;" />
  <img src="Layout_Detector_3_SCs.png" alt="Voltage Glitch Detector with SCs" style="max-width: 45%;" />
</div>

## <a name="fig3"></a>

First of all, we started testing the sensor at the **0, 55, 50, 81 SC array** point. We found a point with **100% true positives**, with a phase shift of **-70°**. After that, we conducted several tests with the same sensitivity at a **-70° phase shift**, reducing the number of SCs to verify the required voltage glitch for breaking AES. 

Subsequently, we identified a boundary point required to break AES at the **0, 55, 50, 83 SC array** point, with **100% true positives** and a phase shift of **-85°**.

Next, we gradually decreased the sensitivity of the sensor to calibrate it, starting from the **-85° phase shift**. We determined that with a **-130° phase shift**, we no longer detected a glitch. To calibrate the sensor, we subsequently divided the range from **-130° to -85°** in half. Thus, we found that the border value was **-115°**, where glitches were still detected. 

Thus, we calibrated the sensor based on the minimum voltage required to break AES. To avoid any **false negatives** due to manufacturing effects, noise levels, or varying environments, we introduced a **5° phase shift safety margin** for the given setup.


### Detection Metrics  

- **Minimum SCs for 100% successful AES glitch:** **0, 55, 50, 83 SC array**  
- **Minimum sensitivity threshold:** **115° phase shift**  

At this point, in the given conditions the detector achieved **100%** in all detection metrics: **Detection Rate**, **Precision**, **Specificity**, and **Accuracy**.


To ensure robustness against **external variations**, eliminating the possibility of **False Negatives**, we introduced a **5° safety margin**:

**-115° + 5° = -110°** - **✨ Phase Shift degrees** 

### Calibration Potential

The detector's calibration strategy is based on:

- Phase shift adjustments of two clocks via the MMCM module

This precise calibration approach allows for highly accurate adjustments, making the detector adaptable to various environments while maintaining fine-tuned safety margins.

### Per-Unit Testing Evaluation

The setup shows considerable promise for **per-unit testing**, enabling the automation of every step in the **Working Process Flow**, which leads to a more efficient and streamlined chip verification process.

