@Echo Off&Setlocal Enabledelayedexpansion
dir /s /b *.v >>filelist.txt;

set iverilog_path=C:\iverilog\bin
set gtkwave_path=C:\iverilog\gtkwave\bin
set path=%iverilog_path%%gtkwave_path%%path%

set tb_moudle=top_tb

iverilog -o "%tb_moudle%.vvp" -f filelist.txt -s "%tb_moudle%" 

vvp -n "%tb_moudle%.vvp"

set gtkw_file="%tb_moudle%.gtkw"
if exist %gtkw_file% (gtkwave %gtkw_file%) else (gtkwave "%tb_moudle%.vcd")

pause
 