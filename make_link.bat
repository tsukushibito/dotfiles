@echo off
cd /d %~dp0

mklink /j %LOCALAPPDATA%\nvim nvim
mklink /j %LOCALAPPDATA%\alacritty alacritty
mklink /j %LOCALAPPDATA%\goneovim goneovim
mklink /j %LOCALAPPDATA%\tmux tmux
set CONFIG_DIR="%USERPROFILE%"\.config
if not exist "%CONFIG_DIR%" (
  mkdir "%CONFIG_DIR%"
)
mklink /j %USERPROFILE%\.config\wezterm wezterm

pause
