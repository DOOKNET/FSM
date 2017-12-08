@echo off
set xv_path=E:\\Softwares\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim tb_FSM_behav -key {Behavioral:sim_1:Functional:tb_FSM} -tclbatch tb_FSM.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
