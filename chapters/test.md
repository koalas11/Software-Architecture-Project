|Activity| Frequency| Complexity | Delay | Component | Molteplicity |
|---|---|---|---|---|---|
|A1 Acquire Phsy Data | 1 / 80 minutes | low | < 1 second | C1 | #npatient/70 (~1000 instantiated components) |
|A2 Acquire Daily Activity Data | 1 / 3 minutes | low | < 1 second | C1 | #npatient/70 (~1000 instantiated components) |
|A4 Identify Ambulance and Hospital + Notify | 700 / day | high | < 2 minutes | C2 | 2 * #nhospital (with hot spare) |
|A9 Identify On-Call Phy + Notify | 6000 / day | medium | < 2 minutes | C2 | 2 * #nhospital (with hot spare) |
|A13 Send Threshold Alert | 16000 / day | low | < 2 minutes | C2 | 2 * #nhospital (with hot spare) |
|A5 Send Phy Data | 15 / day | low | < 1 second | C3 | 2 (with hot spare) |
|A6 View Theraupetic Plan | 1 / day | low | < 30 minutes | C3 | 2 (with hot spare)|
|A7 Send Diagnostic Information | 6000 / day | low | < 30 minutes | C4 | 2 (with hot spare)|
|A8 Send patient Health Info | 6000 / day | low | < 30 minutes | C4 | 2 (with hot spare)|
|A10 Define THera | 2 / hours | medium | < 30 minutes | C5 | 2 (with hot spare)|
|A11 Modify Thera | 2 / hours | medium | < 30 minutes | C5 | 2 (with hot spare)|
|A12 View Patient med Record | 8 / day | low | < 30 minutes | C5 | 2 (with hot spare)|
|A3 Update Sensors Frequencies | 16 / hours | low | < 5 minutes | C5 | 2 (with hot spare)|
|A14 Confirm Phone Call towards Patient | 16000 / day | low | < 30 minutes | C5 | 2 (with hot spare) |
|A15 Patient Data Handler | 1 / 80 minutes + 1 / 3 minutes + 15 / day | high | < 1 minutes | C6 | #npatient/35 (~2000 instantiated components) |
|A16 Verify Exercise Compliance | 1 / day | low | < 30 minutes | C7 | 1 |


|Component | Abstraction | Complexity | Frequency | Delay | Location | Extra Flow | Intra Flow | Sharing | Control Flow |
|---|---|---|---|---|---|---|---|---|---|
|C1 | 35 | 45 | 80 | 40 | 10 | 60 | 0 | 20 | 15 |
