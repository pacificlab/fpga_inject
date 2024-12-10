## . . /firmware/hdl

### AES_SC  

### top_level.v

**Location:** `/firmware/hdl/AES_SC/sources/top_level.v`  
Implements a UART-based AES encryption/decryption system using a Finite State Machine (FSM) for controlling data flow and process coordination.

**Key Features:**
- **UART Receiver (`async_receiver`):** Receives data and outputs 8-bit parallel bytes.
- **UART Transmitter (`async_transmitter`):** Serializes and sends 8-bit parallel bytes.
- **AES Core (`aes_core`):** Performs encryption or decryption based on configuration.

**Finite State Machine (FSM):**
- **States:**
  - `IDLE (0000)`: Waits for start byte.
  - `REC_BYTES (0001)`: Receives 16 bytes.
  - `AES_START (0010)`: Signals AES core to start.
  - `AES_DELAY (1000)`: Waits for AES to finish.
  - `AES_IDLE (0011)`: Monitors AES core.
  - `AES_FINISH (0100)`: Reads AES output.
  - `SEND_BYTE (0101)`: Prepares a byte for transmission.
  - `BYTE_SENDING (0110)`: Sends a byte and shifts data.
  - `BYTE_WAIT (0111)`: Waits for transmitter to idle.
  - `SEND_DELAY (1001)`: Delays between transmissions.

**Workflow:**
1. **Reception:** FSM enters `REC_BYTES` state to store 16 bytes in `data_i`.
2. **Processing:** FSM transitions to `AES_START`, signals AES core, and monitors processing in `AES_IDLE`.
3. **Transmission:** FSM retrieves `data_o` and transmits bytes in `SEND_BYTE`.

**Control Signals:**
- `load_i`: Starts AES core.
- `TxD_start`: Initiates UART transmission.
- `rec_byte_count` & `send_byte_count`: Track received/sent bytes.

**Encryption/Decryption Modes:**
- `dec_i = 0`: Encryption.
- `dec_i = 1`: Decryption.


---

### aes_core.v, aes_ks.v, aes_sbox_lut.v, aes_sbox.v

**Location:** `/firmware/hdl/AES_SC/sources`

### aes_core.v
- Implements AES encryption/decryption logic.
- Interfaces with external `key_i`, `data_i`, and control signals.

---

### aes_ks.v (AES Key Schedule)
- Generates round keys from the 256-bit input key.
- Provides expanded keys for encryption/decryption rounds.

---

### aes_sbox_lut.v (AES Substitution Box using LUT)
- Implements AES S-box as a Look-Up Table (LUT) for fast byte substitution.

---

### aes_sbox.v (AES Substitution Box)
- Alternate implementation of AES S-box (combinational logic or mathematical model).


---

### checkpoints 
**Location:** `/firmware/hdl/AES_SC/checkpoints`  
Contains RapidWright-generated checkpoint files, each with a unique short-circuit configuration.  
- Short circuits activate during cycles 7 and 8 of AES.

---

### UART 

### UART.v

### RS-232 Receiver (`async_receiver`)
**Location:** `/firmware/hdl/UART/sources/UART.v`  
Implements a UART RX (Universal Asynchronous Receiver Transmitter) that receives serial data and reconstructs bytes using a baud-rate clock.

**Key Features:**
- **Clock Frequency (`ClkFrequency`):** Defined by `UART_CLK`.
- **Baud Rate (`Baud`):** Defined by `UART_BAUD`.
- **Oversampling:** Uses 8x oversampling for robustness against timing jitter.
- **Idle Detection:** Detects idle periods and generates end-of-packet signals.

**Inputs/Outputs:**
- **clk:** Input clock signal defined by `ClkFrequency`.
- **RxD:** Serial input signal (RS-232 protocol).
- **RxD_data_ready:** Indicates valid data.
- **RxD_data_error:** Indicates framing errors.
- **RxD_data:** 8-bit parallel output data.
- **RxD_endofpacket:** Packet status signal.
- **RxD_idle:** Indicates idle state.

---

### RS-232 Transmitter (`async_transmitter`)
**Location:** `/firmware/hdl/UART/sources/UART.v`  
Implements a UART TX, serializing 8-bit parallel data for transmission using a baud-rate clock.

**Key Features:**
- **Clock Frequency (`ClkFrequency`):** Defined by `UART_CLK`.
- **Baud Rate (`Baud`):** Defined by `UART_BAUD`.

**Inputs/Outputs:**
- **clk:** Input clock signal defined by `ClkFrequency`.
- **TxD_start:** Starts data transmission.
- **TxD_data:** 8-bit parallel data input.
- **TxD:** Serial output signal.
- **TxD_busy:** Indicates transmitter is busy.

---

### Workflow:
**Receiver (`async_receiver`):**
1. Connecting `RxD` to the serial data line.
2. Monitoring `RxD_data_ready` for valid data; read from `RxD_data`.
3. Checking `RxD_data_error` for framing errors.
4. Using `RxD_idle` and `RxD_endofpacket` for packet handling.

**Transmitter (`async_transmitter`):**
1. Providing data on `TxD_data` and assert `TxD_start` to initiate transmission.
2. Monitoring `TxD_busy` to ensure readiness for the next byte.
3. Serial data is output on `TxD`.

---


### TDC_Sensor 

### top_module.v

**Location:** `/firmware/hdl/TDC_Sensor/sources/top_module.v`  
Implements a Voltage Sensor-based system designed for capturing traces and detecting Side Channel Analysis (SCA) attacks on FPGAs. It utilizes a Time-to-Digital Converter (TDC) alongside a UART-based data transmission module. This modular design enables robust trace capture and efficient transmission, supporting comprehensive side-channel analysis attack detection.

---

#### Key Features:
- **MMCM Module (`mmcm_mod_`):** Generates and manages the clock signals required for the sensor's operation.
- **Sensor Carry Module (`sensor_carry`):** Implements the delay line and extracts the voltage curve behavior.
- **Calibration Module (`calibr_module`):** Calibrates the sensor in any environment automatically.
- **Memory Controller (`mem_control`):** Manages trace data storage and UART-based transmission.
- **UART Transmitter (`uart_tx`):** Sends captured trace data to external devices.

---

#### Workflow:
1. **Calibration:**
   - Triggered using `Start_calibr_btn`.
   - The calibration process adjusts the sensor to predefined values for stable operation.
   - Sends `done_calibr` signal to start the data capture process.

2. **Trace Capture:**
   - `tdl_in` signal enters the delay line, where it propagates through elements clocked by `clk_ps`.
   - Outputs (`Q`) are stored in the memory block.

3. **Data Transmission:**
   - After capturing traces, `mem_control` coordinates parallel data transfer via the `uart_tx` module.
   - `Tx` sends serialized data to a laptop or external device.

---

### Module Descriptions

### **mmcm_mod_.v**
- **Functionality:**
  - Initializes the clock wizard with an MMCM and dynamic phase-shifting capability.
  - Provides the system clock (`clk_in1`) and an independent clock (`clk_ps`).
  - Drives the delay line (`tdl_in`) and other subsystems.

---

### **sensor_carry.v**
- **Functionality:**
  - Processes the `tdl_in` signal through a delay line.
  - Independent clock (`clk_ps`) clocks the flip-flops (FFs).
  - Outputs (`Q`) are written to memory, capturing the voltage curve behavior of the design logic.

---

### **count_ones.v**
- **Functionality:**
  - Continuously monitors the Hamming weight of the sensor's output.
  - Sends this information to the `calibr_module` for further analysis and calibration adjustments.

---

### **calibr_module.v**
- **Functionality:**
  - Automatically calibrates the sensor based on the environment.
  - Sends a `done_calibr` signal to the `mem_control` module after completing the calibration process.

---

### **mem_control.v**
- **Functionality:**
  - After receiving the `Start` signal from `calibr_module`, begins writing trace data to memory.
  - Operates in parallel with `uart_tx` to transmit captured data to external devices.

---

### **uart_tx.v**
- **Functionality:**
  - Serializes data (`tx_data`) and transmits it after receiving a `tx_start` signal.
  - Ensures continuous and efficient data transfer using `o_Tx_Active` and other control signals.

---

### How to Use:

1. **Ensure the MMCM module (`mmcm_mod_`) is configured** to generate the required clocks.

2. **Connect `clk_in1` to the input clock** from the FPGA’s PLL:
    - CW305 - N13 (clk)

3. **Connect UART Rx and Tx signals** to the corresponding pins:
   - CW305 - P16 (Rx)
   - CW305 - R16 (Tx)

4. **Upload the bitstream file** of the sensor onto the corresponding FPGA board: "xc7a35t".

5. **Trigger the calibration process** by pressing the `Start_calibr_btn`.

6. **Ensure calibration, memory and UART modules complete their tasks** of writing and transmitting data after calibration.

7. **Use Hterm software/Python Serial** to communicate with the sensor and receive data, ensuring the correct baud rate is set.




## . . /firmware/rapidwright 

**FPGA Short-Circuit Generation Script Using RapidWright**

This document provides a detailed description of a script designed to programmatically generate configurable short circuits (SCs) within FPGA designs using the RapidWright framework. The script processes Vivado DCP (Design CheckPoint) files and uses tools from BYU Shorty library to define and create shortened regions in the FPGA.

**Features**

Processes Vivado-generated DCP files.
Supports user-defined FPGA device configurations.
Allows selection of specific enabling nets.
Configurable short-circuit regions with various sizes and quantities (e.g., 1000, 2000, ..., 15000 SCs).
Outputs modified DCP files for further analysis.

**Requirements**

Java Development Kit (JDK).
RapidWright framework installed and configured.
BYU Shorty library added as a dependency.
A pre-existing Vivado DCP file for the FPGA design.

**Description of Functions**

1. Initialization

String dcpPath = "<path_to_dcp>"; - Reads a Vivado-generated DCP file (dcpPath).
String deviceName = "<fpga_device_name>"; - Initializes the FPGA device (deviceName).
Design design = Design.readCheckpoint(dcpPath); - Creates a Design object for further manipulation.

2. Net Selection 

Net n = design.getNet("enable_sc"); - Enables target net (enable_sc) to manage a short circuit array within the design.


3. Short Circuit Generation

ShortTools.createShortedRegion(design, start_x, end_x, start_y, end_y, n);
start_x, end_x: Horizontal boundaries of the region.
start_y, end_y: Vertical boundaries of the region.
n: Enabled net


4. Writing the Modified Design

design.writeCheckpoint("<output_path>"); - Saves the updated FPGA design with the short circuits included into a new DCP file.

**Usage Workflow**

1. Define the Input Design: Specify the path to the original DCP file and the FPGA device name.
2. Select the Target Enabling Net: (e.g., enable_sc).
3. Configure Short-Circuit Regions: Call the createShortedRegion function with appropriate parameters for the region size and location.
4. Generate Output Design: Save the modified design into a new DCP file for analysis.












