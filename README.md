# Pipeline Hazard Visualization and Performance Analysis using RIPES

## Aim
To study, visualize, and analyze pipeline hazards in a 5-stage RISC-V
pipelined processor using the RIPES simulator, and to understand their
impact on processor performance.

---

## Introduction
Pipelining is a technique used in modern processors to improve instruction
throughput by overlapping the execution of multiple instructions.
However, pipelining introduces hazards that can affect correctness and
performance.

This project demonstrates two major types of pipeline hazards:
- Data hazards (Read After Write – RAW)
- Control hazards (branch-related hazards)

---

## Tools Used
- RIPES Desktop Simulator
- RISC-V 5-stage in-order processor
- GitHub for project version control

---

## Project Files

| File Name | Description |
|----------|-------------|
| raw_hazards.asm | Demonstrates RAW data hazards and forwarding solution |
| control_hazard.asm | Demonstrates control hazards caused by branch instructions |

## Experiment 1: Data Hazard (RAW)

### Description
A Read After Write (RAW) hazard occurs when an instruction tries to read
a register before a previous instruction has written the correct value
to it.

### Program Used
`raw_hazards.asm`

### Observation
- Without forwarding, dependent instructions use incorrect values.
- With hazard detection and forwarding enabled, the processor forwards
  results directly between pipeline stages, ensuring correctness.

### Expected Register Values (With Forwarding)

| Register | Value | Description |
|---------|-------|-------------|
| x1 | 5 | First operand |
| x2 | 7 | Second operand |
| x3 | 12 | x1 + x2 |
| x4 | 17 | x3 + x1 |
| x5 | 29 | x4 + x3 |

### Result
- Correct output is obtained with forwarding.
- CPI is lower compared to software-based stalling.
- Hardware forwarding provides an efficient solution to RAW hazards.

---

## Experiment 2: Control Hazard

### Description
Control hazards occur due to branch instructions, where the next
instruction address depends on the outcome of a branch.

### Program Used
`control_hazard.asm`

### Observation
- The processor fetches instructions before the branch decision is known.
- When the branch is taken, incorrectly fetched instructions are flushed
  from the pipeline.
- This introduces wasted cycles and increases CPI.

### Control Hazard Characteristics

| Aspect | Observation |
|------|-------------|
| Hazard Type | Control hazard (branch) |
| Cause | Branch decision resolved in EX stage |
| Effect | Pipeline flush of wrong-path instructions |
| Performance Impact | Increased CPI |

### Result
- Control hazards cannot be completely eliminated.
- Pipeline flushes ensure correctness but reduce performance.

---

## Performance Analysis
- Ideal pipelined execution has CPI close to 1.
- RAW hazards increase CPI if not handled properly.
- Control hazards increase CPI due to pipeline flushes caused by branches.

---

## Conclusion
This project demonstrates how pipeline hazards affect execution and
performance in a pipelined processor. Data hazards can be efficiently
handled using forwarding techniques, while control hazards require
pipeline control mechanisms such as flushing. Visualizing these effects
using RIPES provides a clear understanding of modern processor behavior.

---
## Comparative Analysis (Extension)

To understand the relative impact of data hazards and control hazards,
separate experiments were performed.

- RAW hazards were demonstrated using dependent arithmetic instructions.
- Control hazards were demonstrated using loop-based branch instructions.

Data hazards primarily introduce stalls due to operand unavailability,
while control hazards introduce pipeline flushes due to branch resolution.
Both hazards increase CPI, but data hazards generally contribute more
overhead in dependency-heavy instruction sequences.

This approach helps in understanding how different hazard types affect
pipeline performance in real processors.

---
## Team Members
- Adithya Anil  
- Ajmal S  
- Alwin Biju  
- Amith M  
- Noel James Mathew  


