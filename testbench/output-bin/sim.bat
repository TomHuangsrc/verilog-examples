@echo off
iverilog -o test testbench.v
vvp -n test -lxt2
gtkwave testbench.vcd

pause