@echo off
iverilog -o test top.v top_tb.v
vvp -n test -lxt2
gtkwave top_tb.vcd

pause
