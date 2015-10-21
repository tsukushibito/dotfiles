" echom '[vimfiler.vim]'
if neobundle#is_installed('vimfiler')
    let g:vimfiler_as_default_explorer=1

    " Enable file operation commands.
    " Edit file by tabedit.
    " call vimfiler#custom#profile('default', 'context', {
    "       \ 'safe' : 0,
    "       \ 'edit_action' : 'tabopen',
    "       \ })

    augroup vimfiler_autocommand

    autocmd!
    " function! OpenVimFiler()
    "     if has('win32')
    "         nnoremap [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -no-quit<CR>
    "     else
    "         nnoremap [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -no-quit<CR>
    "     endif
    " endfunction

    " autocmd TabEnter * :VimFilerCurrentDir -split -simple -winwidth=40 -no-quit
    " augroup END

endif
