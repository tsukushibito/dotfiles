set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 bomb            " BOM付きにする

" 分割した設定ファイルの読み込み
set runtimepath+=~/.vim/
runtime! userautoload/*.vim

" doxygen-supportディレクトリ追加
set runtimepath+=~/.vim/doxygen-support/
