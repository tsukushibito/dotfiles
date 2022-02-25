@echo off
cd /d %~dp0

mklink /j %LOCALAPPDATA%\nvim nvim

pause
