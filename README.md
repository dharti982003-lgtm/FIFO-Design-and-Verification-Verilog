# FIFO-Design-and-Verification-Verilog
FIFO design and verification using Verilog with testbench and simulation results

## 📌 Project Overview

This project implements a **Synchronous FIFO (First In First Out)** buffer using Verilog HDL. The FIFO operates on a single clock and ensures correct data storage and retrieval while handling boundary conditions such as full and empty.

## 🎯 Objectives
* Design a parameterized synchronous FIFO in Verilog
* Implement reliable read and write operations
* Handle full and empty conditions correctly
* Verify functionality using a testbench

## 🧠 FIFO Theory
FIFO (First In First Out) is a memory structure where data is read in the same order it is written.

### 🔑 Key Signals
* `clk` : System clock
* `rst` : Reset signal
* `wr_en` : Write enable
* `rd_en` : Read enable
* `wr_data` : Input data
* `rd_data` : Output data
* `full` : Indicates FIFO is full
* `empty` : Indicates FIFO is empty
* 
## 🏗️ Design Description
* Implemented using a **circular buffer**
* Uses **write pointer (wr_ptr)** and **read pointer (rd_ptr)**
* FIFO depth and data width are parameterized
* 
### ✨ Features
* Synchronous operation (single clock)
* Full and Empty detection
* Safe read/write operations
* Reset functionality
* 
## ⚙️ Working Principle

* Data is written into FIFO when `wr_en = 1`,`cs = 1` and FIFO is not full
* Data is read from FIFO when `rd_en = 1`,`cs = 1` and FIFO is not empty
* Write pointer increments after write
* Read pointer increments after read

## 🔍 Verification Methodology
* A Verilog testbench is used to generate stimulus
* The following operations are verified:
  * Write operation
  * Read operation
  * Full condition
  * Empty condition
  * 
## ⚠️ Corner Cases Covered
* Writing when FIFO is full (Overflow condition)
* Reading when FIFO is empty (Underflow condition)
* Simultaneous read and write
* Reset behavior
* 
## 📊 Simulation Results
* FIFO operates correctly under all test conditions
* Data integrity is maintained
* Waveforms confirm correct pointer and control behavior
  
## 🛠️ Tools Used
* Verilog HDL
* Vivado
  
## 🚀 Future Improvements
* Implement Asynchronous FIFO
* Add SystemVerilog Assertions (SVA)
* Add functional coverage
* Extend to UVM-based verification
  

