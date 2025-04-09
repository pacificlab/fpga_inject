### External implementation workflow

#### 1. Hardware setup

Refer to `fpga_inject/hardware/README.md` and hardware setup image.  

Note that thunderbolt is not necessary, we can power and program FPGA directly.  
Chipwhisperer Husky can be connected to laptop via microUSB directly.

---

#### 2. External voltage glitch experiments

Refer to `fpga_inject/workflows/characterizing_External_SC_Glitches/`

##### General sequence:  
Generate bitstream with Vivado (AES module) -> Upload bitstream to CW305 with python -> 
Communicate via UART (encrypt/decrypt) -> Inject glitches via Chipwhisperer software.

bitstream location:  
`fpga_inject/workflows/characterizing_External_SC_Glitches/External_Glitches/experiments_/aes.bit`

#### a. Hardware Wiring
- Chipwhisperer Husky → Laptop (microUSB)
- CW305 → Chipwhisperer Husky (SMA cables)
- Laptop USB ↔ CW305 pins:
  - TxD → IO1
  - RxD → IO2 (via UART adapter)
- Trigger:
  - CW305 (IO4) ↔ Chipwhisperer Husky (IO4)

#### b. Glitch Setup

**Before running glitch script:**  
Disable chipwhisperer Husky between runs if runtime error occurs.

```python
scope = cw.scope()
scope.default_setup()

platform = 'cw305'
fpga_id = '35t'
target = cw.target(scope, cw.targets.CW305_ECC, force=True, bsfile="/home/daniil/Desktop/EXTERNAL_GLITCHES/aes.bit")

target.vccint_set(1)  # Voltage (try 0.7–1.0V)
target.pll.pll_outenable_set(True, 1)
target.pll.pll_outfreq_set(15E6, 1)
print(target.pll.pll_outfreq_get(1))

scope.clock.clkgen_freq = 15e6
scope.clock.clkgen_src = 'extclk'
scope.clock.adc_mul = 10
scope.adc.offset = 3
scope.adc.basic_mode = "rising_edge"
scope.trigger.triggers = "tio4"
scope.io.hs2 = "disabled"
scope.adc.stream_mode = True
scope.adc.samples = 1000000
target._clksleeptime = 100
scope.gain.db = 1

scope.clock.reset_adc()
assert scope.clock.adc_locked, "ADC failed to lock"



#### Glitch Configuration


scope.glitch.enabled = True
scope.glitch.clk_src = "pll"
scope.glitch.trigger_src = "ext_single"
scope.trigger.triggers = "tio4"

scope.io.glitch_hp = True
scope.io.glitch_lp = False

scope.glitch.ext_offset = 5
scope.glitch.output = 'enable_only'
scope.glitch.repeat = 3  # 1–3 cycles


#### c. Sending/Receiving Data 

from tqdm.notebook import trange
import numpy as np
import time
import serial
import chipwhisperer as cw

uart_port = "/dev/ttyUSB0"
baud_rate = 38400
uart = serial.Serial(port=uart_port, baudrate=baud_rate, timeout=1)

ktp = cw.ktp.Basic()
trace_array = []
textin_array = []
responses = []

key_i = 'h2b7e151628aed2a6abf7158809cf4f3c'
plaintext = "6bc1bee22e409f96e93d7e117393172a"
plaintext_bytes = bytes.fromhex(plaintext)

key, text = ktp.next()
N = 10
scope.arm()
time.sleep(0.1)

for i in trange(N, desc='Capturing traces'):
    uart.write(plaintext_bytes)
    ret = scope.capture()
    if ret:
        print("Target timed out!")
        responses.append("TIMEOUT")
        continue

    response = uart.read(17)
    hex_response = response.hex() if response else "NO RESPONSE"
    responses.append(hex_response)

    trace_array.append(scope.get_last_trace())
    textin_array.append(text)
    scope.arm()
    key, text = ktp.next()

with open("external_0_7v_2_5_cycles.txt", "w") as f:
    f.write("\n".join(responses))



#### d. Sending via Hterm
After scope.arm() is called and scope is waiting for trigger,
you can send data via Hterm (UART terminal).

```


### 3. Internal SC glitch experiments

#### a. SC Generation (Java + RapidWright)
Tools: IntelliJ, RapidWright, BYU Shorty lib + Vivado DCP

String dcpPath = "<path_to_dcp>";
String deviceName = "<fpga_device_name>";
Design design = Design.readCheckpoint(dcpPath);

Net n = design.getNet("enable_sc");
ShortTools.createShortedRegion(design, start_x, end_x, start_y, end_y, n);
design.writeCheckpoint("<output_path>");


1. Input .dcp

2. Enable target net

3. Create SC region (x, y)

4. Save modified .dcp

Examples:

bit: fpga_inject/firmware/hdl/Voltage_Glitch_Detectors/sources/bitstream_files/
map: fpga_inject/firmware/hdl/Voltage_Glitch_Detectors/Test_Calibration_Map.xlsx



#### b. Python Script
Use fpga_inject/python_scripts/AES_3_SC_Glitch.ipynb
Ensure ADC lock:


scope.clock.reset_adc()
assert scope.clock.adc_locked, "ADC failed to lock"


#### c. Sending/Receiving Data (same as External)


The last two cells in the script are for drawing graphs and can be modified for your convenience.
