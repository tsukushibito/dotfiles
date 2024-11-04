@echo off
cd /d %~dp0

mklink /j %LOCALAPPDATA%\nvim nvim
mklink /j %LOCALAPPDATA%\alacritty alacritty
mklink /j %LOCALAPPDATA%\goneovim goneovim
mklink /j %LOCALAPPDATA%\tmux tmux

pause
