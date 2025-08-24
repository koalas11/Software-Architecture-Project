= Remote Health Monitoring and Telerehabilitation System

A remote health monitoring and telerehabilitation system must be designed and implemented for patients preparing for surgery. Patients must be monitored for physiological parameters and for compliance with daily life activities, including verifying that the patient performs the activities prescribed in the rehabilitation plan. If any detected parameters exceed certain thresholds, the system must send an alert to the attending physician, who must then contact the patient by phone.

The telemonitoring system must be designed to:

1. Acquire sensor data "in real time" according to the schedule defined by the patient's therapeutic plan.

2. Support the physician in redefining the therapeutic plan (including changes to the frequency of physiological parameter monitoring).

3. Automatically implement the updated therapeutic plan.

4. Detect abnormal situations (physiological parameter values outside the thresholds).

5. In case of abnormal situations, identify an on-call physician to visit the patient in person. In case of an alarm situation (e.g., red code), identify the nearest ambulance and hospital to transport the patient.

6. Notify the identified on-call physician by sending the patient's medical record.

7. Allow the on-call physician to send the detected parameters, diagnosis, and other health-related information.

8. Acquire information from the tracking platform about the patient's daily life activities.

9. At the end of the day, verify whether the patient actually performed the rehabilitation exercises at the scheduled times.

== System Assumptions

=== Operational Context

*Geographic Scope*: We assume that the system operates within the Lombardy region, integrating with local healthcare infrastructure and adhering to Italian and European regulatory frameworks (GDPR, medical device certification, telemedicine guidelines).

*Healthcare Infrastructure*: Integration with Lombardy's network includes 8 ATS (Agenzie di Tutela della Salute), 27 ASST (Aziende Socio Sanitarie Territoriali), approximately 180 hospitals, and 1,200 specialist clinics. Geographic distribution concentrates 35% in Milan metropolitan area, 25% in Bergamo-Brescia, 15% in Como-Varese, and 25% across other provinces.

*Target Population*: Primary focus on high-risk pre-surgical patients, estimated at 50,000-70,000 annually from approximately 400,000-500,000 total regional surgical procedures.

=== Technology Integration Assumptions

*Sensor Ecosystem*: We assume that the system supports heterogeneous physiological monitoring devices without managing device lifecycle (provisioning, updates, decommissioning, device problems). Two categories are supported:

- *Automatic sensors*: Continuously collect and transmit data using intelligent, configurable protocols (implantable devices, wearables)
- *Manual input sensors*: Require patient interaction for data collection (blood pressure cuffs, scales, symptom reporting)

*Activity Tracking Platform*: Integration with established third-party platforms rather than direct sensor management. Platforms provide preprocessed daily activity summaries and alerts, eliminating direct sensor complexity while enabling rehabilitation compliance verification.

=== Monitoring Parameters and Frequencies

*Physiological Monitoring* (per patient):
- Automatic sensors: ~178 values/day (~7.4 values/hour)
  - Heart rate: every 15 minutes (96 values/day)
  - Blood pressure: scheduled measurements (10 values/day)
  - Oxygen saturation: every 30 minutes (48 values/day)
  - Temperature: every 2 hours (12 values/day)
  - ECG: anomalous events and daily summary (12 values/day)
- Manual parameters: ~15 values/day (weight, glucose, pain scales, symptoms)
- Data volume: 20-65 KB/patient/day

*Activity Tracking* (per patient via platform):
- Daily metrics: 18 values/day (steps, distance, calories, sleep, activity sessions)
- Data volume: 2-5 KB/patient/day

=== Performance and Scale Assumptions

*System-wide Processing Requirements*:
- Total data throughput: 571,500 values/hour (13.72 million values/day)
- Peak periods: 15-20% above average during morning (6-8 AM) and evening (6-8 PM)
- Emergency scenarios: 350-700 red codes daily (0.5-1% of patients)

*Regulatory and Quality Constraints*: Compliance with healthcare data protection, medical device regulations, and telemedicine standards without compromising emergency response performance requirements.

== Architectural Analysis

=== Architecturally Significant Requirements

The following requirements drive fundamental architectural decisions based on operational constraints and quality attributes:

*Real-time Multi-tier Anomaly Processing*: Single data processing pipeline with three-tier priority-based alert classification from both physiological sensors and activity tracking platforms:
- Red code emergencies: < 1 minute detection, < 2 minute notification (350-700 daily cases from physiological data + 50-100 from activity alerts like falls)
- Standard anomalies: < 5 minute detection, < 2 minute notification (3,500-5,600 physiological + 200-400 activity-based cases)
- Threshold violations: < 30 minute detection, < 2 minute notification (10,500-14,000 physiological + 1,000-2,000 activity-based cases)

Activity platform alerts include emergency situations (falls, extended inactivity periods, abnormal movement patterns) and behavioral anomalies (missed exercises, irregular sleep patterns, activity compliance violations). This drives event-driven architecture with unified data processing and priority-based alert classification.

*Dynamic Therapeutic Plan Management*: Runtime modification of monitoring frequencies and thresholds across distributed patient populations without system downtime, requiring configuration management architecture with consistency guarantees.

*Geographic Load Distribution*: Processing architecture must handle concentrated loads (35% in Milan area) while maintaining consistent service across distributed regional infrastructure.

=== Quality Attribute Drivers

*Availability*: 24/7 operation supporting up to 70,000 concurrent patients across distributed healthcare infrastructure, with fault-tolerance for life-critical scenarios.

*Performance*: 
- Peak throughput: 13.72 million values/day with geographic load concentration
- Emergency response: < 2 minute end-to-end latency for critical alerts
- Concurrent sessions: thousands of simultaneous monitoring across regional facilities

*Scalability*: Horizontal scaling to accommodate varying loads from individual monitoring to regional deployments, with capacity planning for emergency surge scenarios.

*Interoperability*: Seamless integration across heterogeneous ecosystems (sensor networks, activity platforms, healthcare information systems, emergency services) using industry standards.

*Security and Reliability*: Medical-grade data protection and fault-tolerant operation during mission-critical emergency responses.

=== Key Architectural Components

*Multi-source Data Acquisition Layer*: 
- Real-time ingestion from dual data streams (physiological + activity)

*Hierarchical Event Processing Engine*:
- Geographic load balancing reflecting regional distribution

*Alert Orchestration System*:
- Multi-level escalation (emergency dispatch, physician notification, clinical review)

=== Architectural Constraints and Design Trade-offs

*Regional vs. Centralized Processing*: Geographic distribution (35% Milan concentration) suggests hybrid architecture with centralized coordination for major hubs and distributed nodes for peripheral areas.

*Synchronous vs. Asynchronous Communication*: Emergency alerts require synchronous patterns for latency guarantees, while routine monitoring can utilize asynchronous messaging for throughput optimization.

*Event-driven vs. Request-response*: Multi-tier anomaly processing favors event-driven patterns, while physician interactions require request-response for plan management.

*Microservices Complexity*: Diverse integration requirements and independent scaling needs suggest microservices architecture with careful inter-service communication design.

=== Healthcare Data Decentralization Considerations

While not directly related to the core architectural requirements of this remote monitoring system, a decentralized healthcare system architecture could potentially support comprehensive healthcare data sharing and analysis, which are increasingly recognized as critical aspects for advancing medical research and improving patient outcomes.

The BETTER (Better real-world health-data distributed analytics research platform) project, funded by the European Union's Horizon program, demonstrates that decentralized healthcare infrastructure can successfully enable healthcare professionals to exploit large-scale, multi-source health data while maintaining strict privacy compliance. The project has developed a decentralized infrastructure that allows researchers and healthcare professionals to analyze distributed health datasets across national borders using AI-driven tools, all while remaining fully compliant with GDPR privacy guidelines.

This approach suggests that distributed processing capabilities can effectively balance comprehensive healthcare data analysis with stringent privacy and regulatory requirements. The success of the BETTER project across multiple European medical centers demonstrates that a decentralized architecture for remote patient monitoring could align with proven methodologies for secure, cross-border healthcare data utilization while maintaining high standards of patient privacy protection.

Furthermore, the broader European Health Data Space (EHDS) initiative establishes "a common framework and infrastructure for the use of health data for research, innovation, policy-making, and regulatory activities in the European Union" while ensuring that "citizens can securely access and exchange their health data wherever they are in the EU". These initiatives collectively suggest that distributed healthcare architectures can successfully support both individual patient care and population-level health analytics without compromising data security or regulatory compliance.
