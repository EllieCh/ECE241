# ECE241
Compilation of verilog projects done for second year digital systems course. Includes labs and a final project.

These labs often build off each other using simpler, low-level blocks from previous labs to tackle a more elaborate challenges in subsequent labs. This culminated in a final project that was done in a group of two. My project was an audio signal processor that applied certain real-time effects to an audio signal. Although initially slightly ambitious, we managed to get the platform to work as well as implemented a few simple effects in real time.

## Usage
To use this software, you need a windows system with Quartus-Prime v16.1 installed as well as a DE1-SoC FPGA board by Altera.
If you have this, create a project wherein you will need to:
    Add the files from a single lab/part
    Set the device to 5csema5f31c6
    load the pin configuration file DE1_SoC.qsf
Then compile and load the project to the board.

Unfortunatley, due to bad foresight on my part, most of the files for lab6 were misplaced.

<b>Note:</b> Future ECE students, this is here for reference and as a way to see a "different" way of doing things. Please do not use this for your own course work.
