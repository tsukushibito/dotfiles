" echom '[auto-ctags.vim]'
if neobundle#is_installed('auto-ctags.vim')
    let g:auto_ctags=1
    let g:auto_ctags_directory_list-['~/tags']
endif
