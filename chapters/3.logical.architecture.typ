
#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) => if x == 0 or y == 0 { gray },
  align: (center, ) * 10,
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    pad(..it.inset)[N/A]
  } else {
    set align(center)
    it
  }
}

= Chapter 3: Logical Architecture

== Functional Partitioning

=== Motivation
Functional partitioning divides the system into components, each responsible for a specific business function. This approach enhances cohesion, reduces coupling, and improves both maintainability and scalability.

=== Activity-Component Table

#table(
  columns: (auto, ) * 6,
  [Activity], [Frequency], [Complexity], [Delay], [Component], [Multiplicity],
  [A1 Acquire Phys Data], [1 / 80 min], [low], [< 1s], [C1], [\#npatient],
  [A2 Acquire Daily Activity Data], [1 / 3 min], [low], [< 1s], [C1], [\#npatient],
  [A4 Identify Ambulance and Hospital + Notify], [700 / day], [high], [< 2 min], [C2], [1],
  [A9 Identify On-Call Physician + Notify], [6000 / day], [medium], [< 2 min], [C2], [1],
  [A13 Send Threshold Alert], [16000 / day], [low], [< 2 min], [C2], [1],
  [A5 Manually Send Phys Data], [15 / day], [low], [< 1s], [C3], [\#npatient],
  [A6 View Therapeutic Plan], [1 / day], [low], [< 30 min], [C3], [\#npatient],
  [A7 Send Diagnostic Information], [6000 / day], [low], [< 30 min], [C4], [1],
  [A8 Send Patient Health Info], [6000 / day], [low], [< 30 min], [C4], [1],
  [A10 Define Therapy], [2 / hour], [medium], [< 30 min], [C5], [\#nAttendingPhysician],
  [A11 Modify Therapy], [2 / hour], [medium], [< 30 min], [C5], [\#nAttendingPhysician],
  [A12 View Patient Med Record], [8 / day], [low], [< 30 min], [C5], [\#nAttendingPhysician],
  [A3 Update Sensors Frequencies], [16 / hour], [low], [< 5 min], [C5], [\#nAttendingPhysician],
  [A14 Confirm Phone Call to Patient], [16000 / day], [low], [< 30 min], [C5], [1],
  [A15 Patient Data Handler], [1 / 80 min + 1 / 3 min + 15 / day], [high], [< 1 min], [C6], [1],
  [A16 Verify Exercise Compliance], [1 / day], [low], [< 30 min], [C7], [1],
)

=== Component Footprint

#table(
  columns: (auto, auto),
  [Attribute], [Score],
  [Abstraction], [30],
  [Complexity], [35],
  [Frequency], [60],
  [Delay], [25],
  [Location], [15],
  [Extra Flows], [20],
  [Intra Flows], [10],
  [Sharing], [15],
  [Control Flows], [10],
)

#figure(
  image("Functional.svg", width: 80%),
  caption: [
    Functional Partitioning Footprint
  ],
)

Functional partitioning results in high cohesion and clear boundaries of responsibility. This leads to lower complexity, improved abstraction, and reduced sharing and control flow between components. The scores presented reflect the overall system footprint, not those of individual modules.

=== Explanation
Each component (C1-C7) is responsible for a specific set of related activities, thereby maximizing cohesion and minimizing inter-component dependencies.

=== Advantages
- High functional cohesion
- Low coupling
- Easy to maintain and evolve
- Scalable by function

=== Disadvantages
- Requires careful interface design
- Potential duplication of cross-cutting logic

== Alternative Partitioning: Technical Layers

=== Motivation
This approach divides the system into technical layers (Presentation, Business Logic, Data Access), each responsible for a technological aspect across all functionalities. However, this often results in lower cohesion and higher coupling for business features.

=== Activity-Layer Table

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  [Activity], [Frequency], [Complexity], [Delay], [Layer], [Multiplicity],
  [A1 Acquire Phys Data], [1 / 80 min], [low], [< 1s], [Business Logic], [\#npatient],
  [A2 Acquire Daily Activity Data], [1 / 3 min], [low], [< 1s], [Business Logic], [\#npatient],
  [A4 Identify Ambulance and Hospital + Notify], [700 / day], [high], [< 2 min], [Business Logic], [1],
  [A9 Identify On-Call Physician + Notify], [6000 / day], [medium], [< 2 min], [Business Logic], [1],
  [A13 Send Threshold Alert], [16000 / day], [low], [< 2 min], [Business Logic], [1],
  [A5 Manually Send Phys Data], [15 / day], [low], [< 1s], [Presentation], [\#npatient],
  [A6 View Therapeutic Plan], [1 / day], [low], [< 30 min], [Presentation], [\#npatient],
  [A7 Send Diagnostic Information], [6000 / day], [low], [< 30 min], [Data Access], [1],
  [A8 Send Patient Health Info], [6000 / day], [low], [< 30 min], [Data Access], [1],
  [A10 Define Therapy], [2 / hour], [medium], [< 30 min], [Business Logic], [\#nAttendingPhysician],
  [A11 Modify Therapy], [2 / hour], [medium], [< 30 min], [Business Logic], [\#nAttendingPhysician],
  [A12 View Patient Med Record], [8 / day], [low], [< 30 min], [Presentation], [\#nAttendingPhysician],
  [A3 Update Sensors Frequencies], [16 / hour], [low], [< 5 min], [Business Logic], [\#nAttendingPhysician],
  [A14 Confirm Phone Call to Patient], [16000 / day], [low], [< 30 min], [Business Logic], [1],
  [A15 Patient Data Handler], [1 / 80 min + 1 / 3 min + 15 / day], [high], [< 1 min], [Data Access], [1],
  [A16 Verify Exercise Compliance], [1 / day], [low], [< 30 min], [Presentation], [1],
)

=== Layer Footprint

#table(
  columns: (auto, auto),
  [Attribute], [Score],
  [Abstraction], [60],
  [Complexity], [70],
  [Frequency], [80],
  [Delay], [50],
  [Location], [40],
  [Extra Flows], [60],
  [Intra Flows], [50],
  [Sharing], [55],
  [Control Flows], [45],
)

#figure(
  image("Layers.svg", width: 80%),
  caption: [
    Layers Partitioning Footprint
  ],
)

Technical layer partitioning increases overall system complexity and coupling, as business logic is distributed across multiple layers. This results in higher scores for complexity, sharing, and control flows, indicating a less optimal architectural footprint.

=== Explanation
Each layer contains logic for all functionalities, which leads to low cohesion for business features and high inter-layer dependencies.

=== Advantages
- Clear technological separation
- Easier to replace the technology stack

=== Disadvantages
- Low functional cohesion
- High coupling between layers
- More difficult maintenance and testing of business features



== Comparison

Comparing the two architectural partitioning strategies—functional and technical layers—reveals clear differences in system footprint and architectural quality.

#figure(
  image("Functional and Layers.svg", width: 80%),
  caption: [
    Functional and Layers Partitioning Footprint
  ],
)

Functional partitioning consistently achieves lower scores across all footprint attributes, resulting in a smaller overall area. This implies:
- Lower abstraction and complexity values, making the system easier to understand and maintain.
- Reduced frequency, delay, and location scores, reflecting more efficient and localized processing.
- Lower extra flows, intra flows, sharing, and control flows, demonstrating less coupling and fewer unnecessary interactions between components.

In contrast, technical layer partitioning leads to higher values in all these attributes, signifying greater complexity, more interdependencies, and a less maintainable system.

*Conclusion:*
We have chosen functional partitioning because it provides a more modular, maintainable, and scalable architecture. The smaller footprint area directly reflects its superior cohesion, reduced coupling, and overall architectural efficiency. This approach better supports system evolution and long-term robustness.
