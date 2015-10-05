﻿set encoding=utf-8
scriptencoding utf-8
echom '[.vimrc]'
" autocmd VimEnter * 
"             \if @% == ''
"             \   cd ~
"             \   edit .vimrc
"             \else
"             \   cd %:h
"             \endif

set fileencoding=utf-8 bomb            " BOM付きにする

" 分割した設定ファイルの読み込み
set runtimepath+=$HOME/.vim/
echom 'Read userautoload files.'
runtime! userautoload/*.vim

" doxygen-supportディレクトリ追加
" if has('win32')
"     set runtimepath+=$HOME.vim\doxygen-support\
" else
"     set runtimepath+=~/.vim/bundle/neobundle.vim/
" endif
