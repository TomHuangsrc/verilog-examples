
Introduction
============

This code snippet demonstrates a co-simulation of Verilog code and MyHDL code. 
The three modules here presents the absolute minimum for a co-simulation. 

The counter_top.v is the top level module. It instantiates the counter module
(found in file counter.v), which is the module we would like to evaluate. Also
instantiated are the signals which are feed from and to MyHDL.

The hierarchy is shown on the following scheme:


                               +-------------+
                               |             |
                               | counter_top |
                               |             |
                               +-------------+
                                 /         \
                                /           \
                               /             \
                              /               \
                             /                 \
                            V                   V
        +-------------------------+      +----------------+
        |    counter_test.py      |      |                |
        |-------------------------|      |  counter (DUT) |
        | +------------+          |      |                |
        | | clk_driver |          |      +----------------+
        | +------------+          |
        |                         |
        |          +-----------+  |
        |          | checker   |  |
        |          +-----------+  |
        +-------------------------+


The MyHDL program creates instances of clk_driver, counter and a checker. 
The clk_driver and checker are MyHDL modules, while counter is the Cosimulation
object, which enables the simulation of Verilog modules.


Usage
=====

Run the counter_test.py script (the myhdl.vpi should be placed in the same
directory) with the following command:

    python3 counter_test.py

The successful simulation creates *counter_top.vcd*, which can be viewed with
GTKWave:

    gtkwave counter_top.vcd
