## Project Overview
This project aims to produce an electronic drum set that is silent yet feels nearly identical to a real acoustic drum set. I've split the project into two phases:
* Phase 1 - creating a basic kit with a kick drum trigger and 2 drum pads as a proof-of-concept **(completed)**
* Phase 2 - creating a full drum kit with kick trigger, 4 drum pads, and 4 electronic cymbals **(in progress)**

## Full Outline

### Drum Module
* I'm currently using an ESP32 with [edrumulus](https://github.com/corrados/edrumulus/tree/main) and a custom-built analog frontend
  * The ESP32 has a drawback of not being a native MIDI device - it requires a script to appear as a virtual MIDI device
  * I'll be replacing it with a teensy 4.2, which solves this issue. Additionally, it has an SD card slot and plenty of processing power, so hopefully I'll be able to use it as a standalone synthesizer.
* I'm currently designing a PCB which includes the teensy, 8 input jacks, analog frontends for each channel, and display/keypad for controlling settings

Materials:
* Teensy 4.2
* 8x 1/4 inch PCB mount TRS audio jacks
* 16x2 character LCD
* Arduino numeric keypad
* 8x TRS audio cable

Features:
* Teensy 4.2 based - with headers for all GPIOs
* headers for piezo inputs (test points)
* i2c headers for display (VCC, GND, SDA, SCL)
* 8 gpios for numeric keypad

TODO:
* manually verify teensy pins (ADC pins)

### Drum Pads
Materials:
  * Drum Shells
  * Drum top/bottom
  * M6x50mm bolts / M6 wing nuts (2x8 + 2x10 = 36 total)
  * Regular M6 nuts for attaching drum mount
  * M3x10mm bolts/nuts (already own)
  * 2x10in drum head, 2x12in drum head
  * piezos/trigger cones/audio jacks

Notes:
* All drum shells will be printed with [shell.scad](shell.scad) (my script for generating drum shells)
* Drum design is from [Open E-Drums](https://open-e-drums.com/hardware/download_pad_noshell.html)

### Hi-Hat
* Will likely use this [optical hi-hat controller](https://open-e-drums.com/hardware/download_hhc.html)

### Mounting Hardware
Rack will likely be a second-hand alesis e-drum rack

Tom mounts:
*  [Alesis drum clamp mount](https://www.printables.com/model/244788-alesis-electronic-drum-clamp-mount) - these each require an Alesis L-rod
* Modify this [Roland mount](https://open-e-drums.com/hardware/download_mount.html) to change the hole from 11mm (Roland) to 9mm (Alesis)

Snare mount:
* ???

Cymbal Mounts:
* These could use the same alesis drum clamp mounts, but they require a cymbal mount instead of an L-rod (much more expensive)

Hi-Hat Mount:
* Real hi-hat stand. It's really not worth bothering with anything else.


## Members
Ethan James, Computer Engineering Student (2024) -
ethanjamesauto@vt.edu

## Images

This is the prototype (Phase 1):
![](images/IMG_0991.jpg)

