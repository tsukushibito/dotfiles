#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -s $SCRIPT_DIR/nvim ~/.config/nvim
ln -s $SCRIPT_DIR/alacritty ~/.config/alacritty
ln -s $SCRIPT_DIR/goneovim ~/.config/goneovim
ln -s $SCRIPT_DIR/tmux ~/.config/tmux
