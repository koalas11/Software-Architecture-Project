|Activity| Frequency| Complexity | Delay | Component | Molteplicity |
|---|---|---|---|---|---|
|A1 Acquire Phsy Data | 1 / 80 minutes | low | < 1 second | C1 | #npatient |
|A2 Acquire Daily Activity Data | 1 / 3 minutes | low | < 1 second | C1 | #npatient |
|A4 Identify Ambulance and Hospital + Notify | 700 / day | high | < 2 minutes | C2 | 1 |
|A9 Identify On-Call Phy + Notify | 6000 / day | medium | < 2 minutes | C2 | 1 |
|A13 Send Threshold Alert | 16000 / day | low | < 2 minutes | C2 | 1 |
|A5 Manually Send Phy Data | 15 / day | low | < 1 second | C3 | #npatient |
|A6 View Theraupetic Plan | 1 / day | low | < 30 minutes | C3 | #npatient |
|A7 Send Diagnostic Information | 6000 / day | low | < 30 minutes | C4 | 1 |
|A8 Send patient Health Info | 6000 / day | low | < 30 minutes | C4 | 1 |
|A10 Define THera | 2 / hours | medium | < 30 minutes | C5 | #nAttendingPhysician |
|A11 Modify Thera | 2 / hours | medium | < 30 minutes | C5 | #nAttendingPhysician |
|A12 View Patient med Record | 8 / day | low | < 30 minutes | C5 | #nAttendingPhysician |
|A3 Update Sensors Frequencies | 16 / hours | low | < 5 minutes | C5 | #nAttendingPhysician |
|A14 Confirm Phone Call towards Patient | 16000 / day | low | < 30 minutes | C5 | 1 |
|A15 Patient Data Handler | 1 / 80 minutes + 1 / 3 minutes + 15 / day | high | < 1 minutes | C6 | 1 |
|A16 Verify Exercise Compliance | 1 / day | low | < 30 minutes | C7 | 1 |


|Component | Abstraction | Complexity | Frequency | Delay | Location | Extra Flow | Intra Flow | SHaring | Control Flow |
|---|---|---|---|---|---|---|---|---|---|
|C1 | 35 | 45 | 80 | 40 | 10 | 60 | 0 | 20 | 15 |