# Logical architecture

## Activities

|Activity| Frequency| Complexity | Delay | Component |
|---|---|---|---|---|
|A1 Acquire Phsy Data | 1 / 3 minutes * #nPatient | low | < 1 second | C1 |
|A2 Acquire Daily Activity Data | 1 / 80 minutes * #nPatient | low | < 1 second | C1 |
|A3 Identify Ambulance and Hospital + Notify | 700 / day | high | < 2 minutes | C2 |
|A4 Identify On-Call Phy + Notify | 6000 / day | medium | < 2 minutes | C2 |
|A5 Send Threshold Alert | 16000 / day | low | < 2 minutes | C2 |
|A6 Send Phy Data | 15 / day * #nPatient | low | < 1 second | C3 |
|A7 View Theraupetic Plan | 1 / day * #nPatient | low | < 30 minutes | C3 |
|A8 Send Diagnostic Information | 6000 / day | low | < 30 minutes | C4 |
|A9 Send patient Health Info | 6000 / day | low | < 30 minutes | C4 |
|A10 Define Thera | 2 / hours * #nAttentingPhysician | medium | < 30 minutes | C5 |
|A11 Modify Thera | 2 / hours * #nAttentingPhysician | medium | < 30 minutes | C5 |
|A12 View Patient Med Record | 8 / day * #nAttentingPhysician | low | < 30 minutes | C5 |
|A13 Update Sensors Frequencies | 16 / hours * #nAttentingPhysician | low | < 5 minutes | C5 |
|A14 Confirm Phone Call towards Patient | 16000 / day | low | < 30 minutes | C5 |
|A15 Patient Data Handler | 1 / 80 minutes + 1 / 3 minutes + 15 / day * #nPatient | high | < 1 minutes | C6 |
|A16 Verify Exercise Compliance | 1 / day | low | < 30 minutes | C7 |

Frequencies:

- 1 / 3 minutes * #nPatient
- 1 / 80 minutes * #nPatient
- 700 / day
- 6000 / day
- 16000 / day
- 2 / hours * #nAttentingPhysician
- 8 / day * #nAttentingPhysician
- 16 / hours * #nAttentingPhysician
- 1 / day

Delays:

- < 1 second
- < 2 minutes
- < 5 minutes
- < 30 minutes

Locations:

- GPS
- Address
- Patient
- Healthcare facility

## Functional partitioning

### Activity partitionin

| Activity | Component |
| -- | -- |
| A1 Acquire Phsy Data | C1 |
| A2 Acquire Daily Activity | C1 |
| A3 Identify Ambulance and Hospital + Notify | C2 |
| A4 Identify On-Call + Notify | C2 |
| A5 Send Threshold Alert | C2 |
| A6 Send Phy Data | C3 |
| A7 View Theraupetic Plan | C3 |
| A8 Send Diagnostic Information | C4 |
| A9 Send patient Health Info | C4 |
| A10 Define Thera | C5 |
| A11 Modify Thera | C5 |
| A12 View Patient Med Record | C5 |
| A13 Update Sensors Frequencies | C5 |
| A14 Confirm Phone Call towards Patient | C5 |
| A15 Patient Data Handler | C6 |
| A16 Verify Exercise Compliance | C7 |

### Molteplicity and comment

| Component | Molteplicity | Comment |
| -- | -- | -- |
|C1| #nPatient/700 (~100 instantiated components) | Sensors and Data Handler |
|C2| 2 * #nHospital (one hot spare) | Alerts Handler |
|C3| 1 * #nHospital/2 (only bigger hospitals) | Patient Handler |
|C4| 1 * #nHospital/2 (only bigger hospitals) | On-Call Physician Handler |
|C5| 1 * #nHospital/2 (only bigger hospitals) | Attenting Physician Handler |
|C6| 2 * #nHospital (one hot spare) | Patient Data Handler |
|C7|  1 * #nHospital/2 | Exercise compliance handler |

### Evaluation per component

| Component | Abstraction | Complexity | Frequency | Delay | Location | Extra Flow | Intra Flow | Sharing | Control Flow |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| C1 | 20 | 33 | 22 | 25 | 25 | 15 | 15 | 50 | 20 |
| C2 | 40 | 100 | 33 | 25 | 75 | 60 | 0 | 70 | 0 |
| C3 | 20 | 33 | 22 | 50 | 25 | 15 | 15 | 50 | 10 |
| C4 | 20 | 33 | 11 | 25 | 25 | 15 | 0 | 70 | 0  |
| C5 | 20 | 66 | 44 | 50 | 50 | 30 | 0 | 70 | 20 |
| C6 | 20 | 33 | 11 | 25 | 0 | 0 | 15 | 90 | 50 |
| C7 | 20 | 33 | 11 | 25 | 0 | 15 | 15 | 20 | 0 |

## Layers partitioning

## Final Evaluation

| Partitioning method | Abstraction | Complexity | Frequency | Delay | Location | Extra Flow | Intra Flow | Sharing | Control Flow |
|---|---|---|---|---|---|---|---|---|---|
| Functional | 23 | 47 | 22 | 32 | 29 | 21 | 9 | 60 | 14 |
<!-- | Layers | 35 | 45 | 80 | 40 | 10 | 60 | 0 | 20 | 15 | -->
