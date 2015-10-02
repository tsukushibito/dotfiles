" 基本機能に対するマッピング
" .vimrcの編集
noremap <F2> :<C-u>tabedit ~/.vimrc<CR> 
" .vim/userautoloadをVimFilerで開く
noremap <F3> :<C-u>cd ~<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit .vim/userautoload<CR>
" 現在のバッファを再読み込み
noremap <F4> :<C-u>source %<CR>

" Unite
nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap <silent> [Unite]b :<C-u>Unite buffer<CR>

" VimFiler
nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
if has('win32')
    nnoremap <silent> [VimFiler]s :<C-u>VimFiler -split -simple -winwidth=40 -no-quit<CR>
else
    nnoremap <silent> [VimFiler]s :<C-u>VimFiler -split -simple -winwidth=45 -no-quit<CR>
endif
