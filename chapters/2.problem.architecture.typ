= Problem Architecture

== WHO + WHERE

The use case diagram for the Remote Health Monitoring and Telerehabilitation System provides a comprehensive and structured representation of the system's core functionalities and interactions. The diagram identifies all principal actors—including patients, attending and on-call physicians, ambulance and hospital services, as well as external platforms and sensors—reflecting the multi-stakeholder nature of the healthcare environment. Each actor's responsibilities and interactions with the system are clearly delineated, ensuring that the diagram remains accessible and unambiguous.

Central to the diagram is the "Patient Data Handler," which orchestrates the acquisition, processing, and escalation of patient data. This centralization aligns with the system's architectural requirement for unified, real-time data processing and multi-tier anomaly detection. The use of «include» and «extend» relationships effectively distinguishes between mandatory and conditional behaviors, such as the escalation of alerts in response to threshold violations or emergencies. This approach not only reduces redundancy but also enhances the clarity of the system's operational logic.

The diagram comprehensively addresses the functional requirements outlined in the problem analysis. It models the acquisition of physiological and activity data, dynamic therapeutic plan management, detection of abnormal situations, and the escalation of alerts to healthcare professionals and emergency services. The integration with external platforms and sensors is explicitly represented, supporting the system's need for interoperability and seamless data exchange.

While the use case diagram primarily focuses on functional interactions, it implicitly supports key architectural quality attributes such as availability, scalability, and interoperability by modeling clear escalation paths and integration points. Non-functional requirements—such as security, regulatory compliance, and performance—are not directly depicted, which is consistent with the scope of use case modeling but should be addressed in complementary architectural views.

Overall, the use case diagram demonstrates clarity, completeness, and adherence to software architecture best practices. It provides a solid foundation for subsequent architectural design, ensuring that both routine monitoring and critical emergency workflows are robustly supported within the system.

== WHAT + WHERE

== WHY + HOW