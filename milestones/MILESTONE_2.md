### Comparative study: short-circuits vs. external glitches (unprotected)

In the given milestone, the following points should be completed:

- **a.** Characterize external glitch effects and compare them to short-circuits
- **b.** Attempt fault injection using both internal (short-circuit) and external voltage glitches
- **c.** Using the test methodology from point 1, assess the effectiveness of internal vs. external glitches
- **d.** Provide a status update on the GitHub project page, documenting the results of the study

---

### What Was Done:

- **a.** External glitch effects were characterized and compared to short-circuits in  
  `/workflows/characterizing_External_SC_Glitches/External_Glitches/`
  - `_AES_External_Glitches_Map.xlsx_`: Map of the experiments
  - `_AES_External_Glitches_Results.png_`: The result graph of the experiments
  - `_External_Glitches_Layout.png_`: The layout of the AES module

  `/workflows/characterizing_External_SC_Glitches/External_Glitches/experiments_/`: Contains all data, output graphs of the glitches, bitstream, and script files for external experiments.

  `/workflows/characterizing_External_SC_Glitches/SC_Glitches/experiments_/`: Contains all data, output graphs of the glitches, bitstream, and script files for internal experiments.

- **b.** Fault injection using both internal (short-circuit) and external voltage glitches was conducted and documented in:  
  `/workflows/characterizing_External_SC_Glitches/External_Glitches/` - External fault injections  
  `/workflows/characterizing_External_SC_Glitches/SC_Glitches/` - Internal fault injections

- **c.** Effectiveness of internal vs. external glitches was analyzed and documented, based on the detection metrics in  
  `/workflows/characterizing_External_SC_Glitches/README.md`

- **d.** Code, documentation, and related items were re-released on GitHub.
