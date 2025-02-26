## Phase Adjustable Glitch Detector with Configurable Delay Line  


### Main Components

The main components of the given sensor, as shown in [**Fig. 1**](#fig1), include a **configurable delay line** consisting of **Carry 4 delay elements** (Artix-7), a **Mixed-Mode Clock Manager (MMCM)** module from **Xilinx Vivado**, and an **alarm module**.

#### Fig. 1
## <a name="fig1"></a>
![Fig. 1: Voltage Glitch Detector](Schematic_Detector_2.png)



### Featured Characteristics  

The detector was implemented due to the features of the sensor, particularly its its ability to **fine-tune** during the calibration phase, utilizing two parameters. It leverages the **phase shift** capability of the MMCM and features a **configurable delay line**, enabling precise calibration by adjusting:

1. **The phase shift of the propagation signal**
2. **The delay of the sensor**

By tuning these two parameters, the detector achieves highly accurate calibration.
 

### Working Process Flow  

The working process flow of the sensor is as follows:

1. **Determining the Required SCs:** We first identify the minimum number of **short-circuits (SCs)** needed for a successful glitch.

2. **Calibrating the Sensor:** We adjust the **phase shift** between the signal propagating through the delay line and the clock signal driving the register at the end of the delay block.

3. **Validating the Delay Line Configuration:** We verify whether the sensor's delay configuration is appropriate for the given setup. (Allow for further calibration if necessary)

By leveraging these tuning mechanisms, the detector achieves precise calibration, independently controlling **phase shift** and **sensor delay**.


### Conducted Experiments  

The layout of the sensor and AES module is shown in [**Fig. 2**](#fig2), and the layout of the setup with the SC array is depicted in [**Fig. 3**](#fig2). The thorough map of experiments is provided in `/Voltage_Glitch_Detectors/Test_Calibration_Map.xlsx`.

#### Fig. 2, 3
## <a name="fig2"></a>
<div style="display: flex; justify-content: space-around;">
  <img src="Layout_Detector_2.png" alt="Voltage Glitch Detector" style="max-width: 45%; margin-right: 10px;" />
  <img src="Layout_Detector_2_SCs.png" alt="Voltage Glitch Detector with SCs" style="max-width: 45%;" />
</div>

## <a name="fig3"></a>

We conducted a series of experiments to test the detector’s sensitivity and performance:

First, we tested the number of **short-circuits (SCs)** required to successfully glitch the AES module with the given setup. During these tests, we also varied the **phase shift** of the delay signal to adjust the sensitivity.

We identified the point at which we achieved 100% true positives, with **100% successful glitches**, using the minimum number of SCs, and **100% detection rate**.

Thus, we determined the minimum voltage level for a successful glitch and the **border level of sensitivity** at which this voltage glitch is successfully detected. We achieved **100% true positives** at the **0, 55, 50, 83 SC array** and a **-74° phase shift**.

To minimize the risk of **false negatives**, we introduced a **safety margin** in the phase shift.

 
### Detection Metrics  

After conducting extensive tests, we determined:  

- The minimum SCs required for a **100% successful AES glitch**: **0, 55, 50, 83 SC array**  
- The minimum sensitivity threshold: **74° phase shift**  

At this point, in the given conditions the detector achieved **100%** in all detection metrics: **Detection Rate**, **Precision**, **Specificity**, and **Accuracy**.

To ensure robustness against **manufacturing variations, noise, and environmental factors**, we introduced a **5° safety margin**:

**-75° + 5° = -69°** - **✨ Phase Shift degrees**   

### Calibration Potential  

The detector's calibration approach relies on:  

1. **Phase shift adjustments** using the MMCM module  
2. **A configurable delay line** for fine-tuning  

This dual-parameter calibration method enables highly precise detector adjustments, making it suitable for deployment **in any environment** while maintaining **fine-tuned safety margins**.  

### Per-Unit Testing Evaluation

**Per-unit testing** shows great potential for the setup, as it can automate all steps in the **Working Process Flow**, leading to a more efficient and streamlined chip verification process.

