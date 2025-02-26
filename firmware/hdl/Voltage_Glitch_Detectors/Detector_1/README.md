## Glitch Detector with Adjustable Calibration 

### Main Components

The main components of the given sensor, as shown in [**Fig. 1**](#fig1), include a **delay line** consisting of **Carry 4 delay elements** (Artix-7), a **Mixed-Mode Clock Manager (MMCM)** module from **Xilinx Vivado**, and a **control block**.

#### Fig. 1
## <a name="fig1"></a>
![Fig. 1: Voltage Glitch Detector](Schematic_Detector_1.png)


### Featured Characteristics

The detector was implemented due to the features of the sensor, particularly its sensor delay line, allowing it to determine the Hamming weight value of the glitch that successfully attacks the target module. This enables us to define the strength of the glitch and extract calibration margins, ensuring successful deployment of the sensor on any FPGA board, and regardless of voltage noise levels.

### Working Process Flow 

The working process flow of the sensor is as follows:

1. **Glitching the Target AES Module:** We first apply glitches to the AES module and determine the required number of short-circuits (SCs) to successfully glitch the AES module.
2. **Calibration Delay Line Measurement:** Using the calibration delay line, we determine the Hamming weight value of the sensor, corresponding to the predefined number of SCs required for a successful AES glitch.
3. **Presetting the Calibration Logic:** The predefined Hamming weight value is then set in the calibration logic of the control block, ensuring safe margins.

By utilizing this detection system, we can define voltage glitch values and successfully implement the detector independently of current noise voltage levels and environmental conditions.

### Conducted Experiments 

The layout of the sensor and AES module is shown in [**Fig. 2**](#fig2), and the layout of the setup with the SC array is depicted in [**Fig. 3**](#fig2). The thorough map of experiments is provided in `/Voltage_Glitch_Detectors/Test_Calibration_Map.xlsx`.

#### Fig. 2, 3
## <a name="fig2"></a>
<div style="display: flex; justify-content: space-around;">
  <img src="Layout_Detector_1.png" alt="Voltage Glitch Detector" style="max-width: 45%; margin-right: 10px;" />
  <img src="Layout_Detector_1_SCs.png" alt="Voltage Glitch Detector with SCs" style="max-width: 45%;" />
</div>

## <a name="fig3"></a>



First of all, we conducted a series of tests with different numbers of SCs to determine the minimum number required to successfully glitch the AES module. This allowed us to identify the minimum actual voltage level capable of glitching the AES module. 

Next, we determined the Hamming weight values of the detector for the given voltage glitch strength. In our setup, the required SCs for a successful AES glitch were **0, 55, 50, 83**, and the corresponding Hamming weight value was **7**.

Since the strength of the glitch capable of successfully glitching AES may fluctuate due to different mappings, and manufucturing features we maintain safe margins of **5 Hamming weight values**. Thus, for the given setup, we set an alarm threshold at:

**7 + 5 = 12** - **✨ Hamming Weight Values**


### Detection Metrics 

After conducting the experiments, we identified that the minimum number of SCs for a **100% successful AES glitch** were **0, 55, 50, 83**. We used this voltage level while calculating the detection metrics of the sensor. 

Additionally, we determined that the **minimum sensitivity** of the sensor corresponds to **7 Hamming weight** at this voltage glitch level. At this point, the following metrics: **Detection Rate**, **Precision**, **Specificity** and **Accuracy** achieved **100%**.

To ensure robustness against **manufacturing variations, noise levels, and environmental dependencies**, we increased the sensor's sensitivity by **5 Hamming weight values**, minimizing the risk of **false negatives**.

### Calibration Potential of the Sensor 

The calibration approach, based on the integrated delay line of the given detector, allows monitoring of voltage glitch strength. This capability enables the sensor to be deployed in **any environment, on any FPGA board, and under any voltage noise level**, independent of manufacturing variations.

### Per-Unit Testing Evaluation

The potential for **per-unit testing** is promising for the given setup, as all steps in the **Working Process Flow** can be potentially automated. This enables a streamlined and efficient verification process for each chip.
