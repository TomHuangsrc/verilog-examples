'''
#!/usr/bin/env python3
'''
''' 
Jan Marjanovic, 2015

A extremely simple example of co-simulation of MyHDL and Verilog code.
'''

import os
from myhdl import Cosimulation, Simulation, Signal, delay, always, intbv, now


def clk_driver(clk, period=10):
    ''' Clock driver '''
    @always(delay(period//2))
    def driver():
        clk.next = not clk

    return driver


def counter(clk, q):
    ''' A Cosimulation object, used to simulate Verilog modules '''
    os.system('iverilog -o counter counter.v counter_top.v')
    return Cosimulation('vvp -m ./myhdl.vpi counter', clk=clk, q=q)


def checker(clk, q):
    ''' Checker which prints the value of counter at posedge '''
    @always(clk.posedge)
    def check():
        print('from checker, time=', now(), ' q=', q)

    return check


clk = Signal(0)
q = Signal(intbv(0)[4:])

clk_driver_inst = clk_driver(clk)
counter_inst = counter(clk, q)
checker_inst = checker(clk, q)

sim = Simulation(clk_driver_inst, counter_inst, checker_inst)
sim.run(200)

import os
os.popen("gtkwave counter_top.vcd")