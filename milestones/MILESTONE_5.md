### Automation of Testing/Calibration/Scaling

In the given milestone, the following points should be completed:

- **a.** Test possibilities for automation of testing and calibration (of the sensors)
- **b.** Compare different samples of FPGAs using the same design and the same glitch, and reassess success to investigate chip-to-chip manufacturing variation
- **c.** Status update on the GitHub project page, documenting the results of the study

---

### What Was Done:

- **a.** Possibilities for automation of testing and calibration (of the sensors) were examined:

1.  `fpga_inject/firmware/hdl/Voltage_Glitch_Detectors/Detector_1/README.md`
2.  `fpga_inject/firmware/hdl/Voltage_Glitch_Detectors/Detector_2/README.md`
3.  `fpga_inject/firmware/hdl/Voltage_Glitch_Detectors/Detector_3/README.md`


- **b.** Different samples of FPGAs (10 instances - XC7A35T-1FTG256C AMD FPGA) were compared using SC-based glitch and the Glitch Detector with an Adjustable Calibration Line. Success was reassessed, and chip-to-chip manufacturing variation was identified:

  `fpga_inject/firmware/hdl/Voltage_Glitch_Detectors/10_FPGAs_Calibration`

- **c.** Code, documentation, and related items were re-released on GitHub.
