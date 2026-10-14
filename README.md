# Programmable PWM Generator with Dead Time Insersion Using Verilog

## Project Overview

This project implements a PWM generator with dead-time control using Verilog HDL.

It generates two complementary PWM signals, `pwm_A` and `pwm_B`, with a configurable duty cycle and dead time.

## Features

- Adjustable PWM duty cycle
- Configurable dead time
- Two complementary PWM outputs
- Asynchronous reset
- Verilog testbench for simulation

## Inputs and Outputs

 clk - Clock input 
 rst - Reset input
 duty - Duty cycle setting
 dead_time - Dead-time setting
 pwm_A - First PWM output
 pwm_B - Second PWM output

## Testbench

The testbench verifies the design using two test cases:

- Duty cycle: 10%, dead time: 15
- Duty cycle: 20%, dead time: 5

The simulation generates a `pwm.vcd` waveform file for analysis.

## Applications

- Motor control
- Power electronics
- DC-DC converters
- Inverter circuits

## Tools Used

- Verilog HDL
- Verilog simulator
- VCD waveform viewer

## Conclusion

This project demonstrates counter-based PWM generation with complementary outputs and configurable dead-time control using Verilog HDL.
