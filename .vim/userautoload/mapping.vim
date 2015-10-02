" 基本機能に対するマッピング
" .vimrcの編集
noremap <F2> :<C-u>tabedit ~/.vimrc<CR> 
" .vim/userautoloadをVimFilerで開く
if has('win32')
    noremap <F3> :<C-u>cd $HOME<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit .vim/userautoload<CR>
else
    noremap <F3> :<C-u>cd ~<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit .vim/userautoload<CR>
end
" 現在のバッファを再読み込み
noremap <F4> :<C-u>source %<CR>

" Unite
nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap <silent> [Unite]b :<C-u>Unite -auto-resize -direction=dynamicbottom buffer<CR>

" VimFiler
nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
if has('win32')
    nnoremap <silent> [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -no-quit -toggle<CR>
else
    nnoremap <silent> [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -no-quit -toggle<CR>
endif
nnoremap <silent> [VimFiler]d :<C-u>VimFilerDouble -toggle<CR>

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ClangFormat
nnoremap [ClangFormat] <Nop>
nmap <Space>c [ClangFormat]
nnoremap <silent> [ClangFormat]f :<C-u>ClangFormat<CR>
