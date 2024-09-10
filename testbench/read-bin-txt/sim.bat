@echo off
iverilog -o test tb_top.v
vvp -n test -lxt2
gtkwave tb_top.vcd

pause