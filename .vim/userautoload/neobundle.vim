" echom '[neobundle.vim]'
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'osyo-manga/vim-marching.git'
NeoBundle 'kana/vim_operator-replace'
NeoBundle 'kana/vim-altr'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'easymotion/vim-easymotion'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Read setting files of each plugins
" echom 'Reading setting files of each plubins.'
" runtime! userautoload/plugin/*.vim
