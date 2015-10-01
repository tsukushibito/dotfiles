" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    if has('win32')
        set runtimepath+=$HOME\.vim\bundle\neobundle.vim\
    else
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
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
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'vim-scripts/TagHighlight'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Read setting files of each plugins
runtime! userautoload/plugins/*.vim
