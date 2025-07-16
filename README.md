# FPGA Reaction Timer using VHDL

This project implements a digital reaction timer game using sequential circuit design on an FPGA board. Built around a finite state machine (FSM) in VHDL, the circuit measures human reaction time in milliseconds and displays the result on a pair of 7-segment displays.

---

## ⚙️ Overview

Designed as part of a CS232 digital logic course, this project explores **Moore state machines**, **timing control**, and **real-time interaction** using switches and LEDs on a physical FPGA board. The timer displays the time it takes to respond to a visual cue.

---

## 🧩 Core Components

- **Moore State Machine (`timer.vhd`)**
  - Three-state sequential circuit handling start, wait, and capture logic
  - Generates a millisecond counter
  - Responds to button inputs and drives state transitions

- **Display Drivers (`hexdisplay.vhd`)**
  - Converts the binary millisecond count into signals for 7-segment display
  - Two display units are used for visual output

- **Top-Level Circuit (`reaction.vhd`, `reaction.bdf`)**
  - Integrates timer, display driver, and state indicators (LEDs)
  - Controls inputs, timing logic, and display mapping

---

## 🧪 Hardware Behavior

- Press a button to start the game.
- Wait for the LED to turn on.
- Press another button as quickly as possible.
- Your reaction time (in milliseconds) is shown on the displays.
- State transitions are shown via LEDs.

---

## 📁 Project Contents

| File/Folder               | Description |
|--------------------------|-------------|
| `reaction.vhd`           | Top-level VHDL integration |
| `reaction.bdf`           | Block diagram of the system |
| `timer.vhd`              | Core FSM timer module |
| `hexdisplay.vhd`         | 7-segment display decoder |
| `IMG20250310232817.jpg`  | Board layout or LED state capture |
| `IMG20250310234140.jpg`  | Another board photo (during execution) |
| `Project3_Report_AayanShah.pdf` | Full project documentation |
| *Video file omitted*     | Demo excluded due to file size |

---

## 🧠 Reflection

This project provided hands-on experience with sequential circuit design using VHDL. Building and testing a finite state machine that reacts to real-time input made abstract concepts like timing and state transitions feel concrete and intuitive. While time constraints limited full implementation of a two-player mode, the system demonstrates robust single-player performance.

---

## 👤 Author

**Aayan Shah**  
Computer Science & Physics Student  
[GitHub Profile](https://github.com/aayans314)
