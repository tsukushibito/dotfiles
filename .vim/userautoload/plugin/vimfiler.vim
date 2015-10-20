" echom '[vimfiler.vim]'
if neobundle#is_installed('vimfiler')
    let g:vimfiler_as_default_explorer=1

    " Enable file operation commands.
    " Edit file by tabedit.
    call vimfiler#custom#profile('default', 'context', {
          \ 'safe' : 0,
          \ 'edit_action' : 'tabopen',
          \ })

    " augroup vimfiler_autocmd
    "     autocmd!
    "     autocmd TabEnter * VimFilerCurrentDir -split -simple -winwidth=40 -no-quit -toggle<CR>
    " augroup END
endif
