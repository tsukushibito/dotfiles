﻿echom '[neobundle.vim]'
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
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
" NeoBundle 'vim-scripts/TagHighlight'
" NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'rhysd/vim-clang-format'
" NeoBundle 'vim-scripts/a.vim'
" NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-lua-inspect'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'osyo-manga/vim-marching.git'
NeoBundle 'kana/vim-altr'
" NeoBundle 'bbchung/clighter'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Read setting files of each plugins
echom 'Reading setting files of each plubins.'
" runtime! userautoload/plugin/*.vim
