# FPGA Fault Injection Testing with Short-Circuits

Fault injection aims at disrupting the orderly way in which data and instructions in a chip are processed. This can be achieved, e.g., by malicious glitches that briefly interrupt the supplied voltage of the chip. To better protect against faults, countermeasures need to be implemented, such as glitch sensors that can detect these adversarial conditions. Due to the wide range of fault injection methods, the development of glitch sensors is time-consuming and requires a wide range of lab capabilities to confirm that they work properly. This is a process that we want to simplify for the global community of researchers, creators, and open-source enthusiasts.

## ⭐ Project Goals

In this project we seek to demonstrate that in-situ fault injection by creating short-circuits in an FPGA is possible and that this can be used to emulate similar effects in the circuit that otherwise would require costly external instruments. 

* Demonstrate feasability of fault injection through short-circuits in FPGAs and to show their superiority for testing purposes by comparing them to traditional (externally generated) voltage glitches
* Enable large scale, per-unit testing of FPGA IP cores vs. fault injection such that assurance of fully working countermeasures in every device is guaranteed (i.e., to do this in a fully automated way for every device and without external instruments)
* By following this approach, to implement _and calibrate_ glitch detection countermeasures such that they perform better than state-of-the-art countermeasures that are not calibrated on a per-unit basis

## 🟠 Status

This project is ongoing. It is structured as follows:
* [Milestone 1](https://github.com/pacificlab/fpga_inject/blob/main/milestones/MILESTONE_1.md): Develop Hardware Setup and Test Methodology
* [Milestone 2](https://github.com/pacificlab/fpga_inject/blob/main/milestones/MILESTONE_2.md): Comparative Study: short-circuits vs. external glitches (_unprotected scenario_)
* [Milestone 3](https://github.com/pacificlab/fpga_inject/blob/main/milestones/MILESTONE_3.md): Develop Glitch Detectors
* [Milestone 4](https://github.com/pacificlab/fpga_inject/blob/main/milestones/MILESTONE_4.md): Comparative Study: short-circuits vs. external glitches (_protected scenario_)
* [Milestone 5](https://github.com/pacificlab/fpga_inject/blob/main/milestones/MILESTONE_5.md): Automation of Testing / Calibration / and Scaling

## ✨ 101 on How to Get Started

This project is based on the following hardware:
* ChipWhisperer CW305 FPGA board (soldered or socketed version)
* *optional*: ChipWhisperer Husky (_alternatively_: ChipWhisperer Lite, untested)

For full reproducibility of results, using the ChipWhisperer Husky is required. If short-circuits are deemed sufficient, then the CW305 will be enough.

### Requirement Software and Resources

- **Internal FI**:  
   **Tools** - `software/`
  - Xilinx Vivado
  - RapidWright
  - SC GitHub Repository  
   **Instruction Guide to get started**: `workflows/characterizing_SCs_using_TDC/README.md`

- **External FI**:  
   **Tools** - `software/`
  - ChipWhisperer Husky Software  
   **Instruction Guide to get started**: `setup/INSTALL_CW.md`


## ⚙️ Other section

Add another relevant section here

## ✅ Features

Add another relevant section here

# Contributing (inbound=outbound)

Consistent with Section D.6. of the [GitHub Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service) as of November 16, 2020, and Section 5. of the Apache License, Version 2.0, the project maintainer for this project accepts contributions using the inbound=outbound model. When you submit a pull request to this repository (inbound), you are agreeing to license your contribution under the same terms as specified under [License](https://github.com/decryptofy/insitu_fpga_nlnet/blob/main/LICENSE) (outbound).

# Authors

* Daniil Lytikov
* Garren Dutto
* Vincent Immler

# Copyright

Copyright (2024) by Vincent Immler.

# Citation

Some aspects of this work are _to appear_ in: "In-Situ FPGA Fault Injection with Short-Circuits" by Garren Dutto, Daniil Lytikov, and Vincent Immler. IEEE International Conference on Physical Assurance and Inspection of Electronics (PAINE), 2024.

# Acknowledgements

The majority of this work is/was funded by [NLnet](https://nlnet.nl/project/FPGA-Inject/) under grant number 2023-12-163. Theme fund: NGI0 Entrust. Start: 2024-02.

# License

Apache License, Version 2.0
