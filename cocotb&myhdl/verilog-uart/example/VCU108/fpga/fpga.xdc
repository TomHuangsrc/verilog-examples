# XDC constraints for the Xilinx VCU108 board
# part: xcvu095-ffva2104-2-e

# General configuration
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

# System clocks
# 300 MHz
#set_property -dict {LOC G31  IOSTANDARD DIFF_SSTL12} [get_ports clk_300mhz_1_p]
#set_property -dict {LOC F31  IOSTANDARD DIFF_SSTL12} [get_ports clk_300mhz_1_n]
#create_clock -period 3.333 -name clk_300_mhz_1 [get_ports clk_300mhz_1_p]
#set_clock_groups -asynchronous -group clk_300mhz_1

#set_property -dict {LOC G22  IOSTANDARD DIFF_SSTL12} [get_ports clk_300mhz_2_p]
#set_property -dict {LOC G21  IOSTANDARD DIFF_SSTL12} [get_ports clk_300mhz_2_n]
#create_clock -period 3.333 -name clk_300mhz_2 [get_ports clk_300mhz_2_p]
#set_clock_groups -asynchronous -group clk_300mhz_2

# 125 MHz
set_property -dict {LOC BC9  IOSTANDARD LVDS} [get_ports clk_125mhz_p]
set_property -dict {LOC BC8  IOSTANDARD LVDS} [get_ports clk_125mhz_n]
create_clock -period 8.000 -name clk_125mhz [get_ports clk_125mhz_p]
set_clock_groups -asynchronous -group clk_125mhz

# 90 MHz
#set_property -dict {LOC AL20 IOSTANDARD LVCMOS18} [get_ports clk_90mhz]
#create_clock -period 11.111 -name clk_90mhz [get_ports clk_90mhz]
#set_clock_groups -asynchronous -group clk_90mhz

# LEDs
set_property -dict {LOC AT32 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[0]}]
set_property -dict {LOC AV34 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[1]}]
set_property -dict {LOC AY30 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[2]}]
set_property -dict {LOC BB32 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[3]}]
set_property -dict {LOC BF32 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[4]}]
set_property -dict {LOC AV36 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[5]}]
set_property -dict {LOC AY35 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[6]}]
set_property -dict {LOC BA37 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[7]}]

# Reset button
set_property -dict {LOC E36  IOSTANDARD LVCMOS12} [get_ports reset]

# Push buttons
set_property -dict {LOC E34  IOSTANDARD LVCMOS12} [get_ports btnu]
set_property -dict {LOC M22  IOSTANDARD LVCMOS12} [get_ports btnl]
set_property -dict {LOC D9   IOSTANDARD LVCMOS12} [get_ports btnd]
set_property -dict {LOC A10  IOSTANDARD LVCMOS12} [get_ports btnr]
set_property -dict {LOC AW27 IOSTANDARD LVCMOS12} [get_ports btnc]

# DIP switches
set_property -dict {LOC BC40 IOSTANDARD LVCMOS12} [get_ports {sw[0]}]
set_property -dict {LOC L19  IOSTANDARD LVCMOS12} [get_ports {sw[1]}]
set_property -dict {LOC C37  IOSTANDARD LVCMOS12} [get_ports {sw[2]}]
set_property -dict {LOC C38  IOSTANDARD LVCMOS12} [get_ports {sw[3]}]

# UART
set_property -dict {LOC BE24 IOSTANDARD LVCMOS18 SLEW SLOW DRIVE 8} [get_ports uart_txd]
set_property -dict {LOC BC24 IOSTANDARD LVCMOS18} [get_ports uart_rxd]
set_property -dict {LOC BF24 IOSTANDARD LVCMOS18 SLEW SLOW DRIVE 8} [get_ports uart_rts]
set_property -dict {LOC BD22 IOSTANDARD LVCMOS18} [get_ports uart_cts]
