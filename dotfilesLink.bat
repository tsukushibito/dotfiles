mklink %HOMEDRIVE%%HOMEPATH%\.vimrc %CD%\.vimrc
mklink %HOMEDRIVE%%HOMEPATH%\.gvimrc %CD%\.gvimrc
mklink /D %HOMEDRIVE%%HOMEPATH%\.vim %CD%\.vim

git clone https://github.com/Shougo/neobundle.vim.git %HOME%.vim\bundle\neobundle.vim