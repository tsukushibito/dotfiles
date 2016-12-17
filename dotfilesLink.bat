mklink %HOMEDRIVE%%HOMEPATH%\.vimrc %CD%\.vimrc
mklink %HOMEDRIVE%%HOMEPATH%\.gvimrc %CD%\.gvimrc
mklink /D %HOMEDRIVE%%HOMEPATH%\.config\vim %CD%\vim\

git clone https://github.com/Shougo/dein.vim %HOMEDRIVE%%HOMEPATH%\.cache\vim\dein\repos\github.com\Shougo\dein.vim
