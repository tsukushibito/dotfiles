#!/bin/sh
ln -sfn $PWD/.vimrc ~/.vimrc
ln -sfn $PWD/.gvimrc ~/.gvimrc
ln -sfn $PWD/.vim/ ~/.vim

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
