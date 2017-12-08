@echo off
set xv_path=E:\\Softwares\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto f074f2b6e1b244d3ae16aa7fede33a2e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_FSM_behav xil_defaultlib.tb_FSM xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
