scriptencoding utf-8
" 基本機能に対するマッピング
" .vimrcの編集
noremap <F2> :<C-u>tabedit ~/.vimrc<CR> 
" .vim/userautoloadをVimFilerで開く
if has('win32')
    noremap <F3> :<C-u>cd $HOME<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit -toggle .vim/userautoload<CR>
else
    noremap <F3> :<C-u>cd ~<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit -toggle .vim/userautoload<CR>
end
" 現在のバッファを再読み込み
noremap <F4> :<C-u>source %<CR>

" Unite
nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap [Unite]b :<C-u>Unite -auto-resize -direction=dynamicbottom buffer<CR>

" VimFiler
nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
if has('win32')
    nnoremap [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -no-quit -toggle<CR>
else
    nnoremap [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -no-quit -toggle<CR>
endif
nnoremap [VimFiler]d :<C-u>VimFilerDouble -toggle<CR>

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ClangFormat
nnoremap [ClangFormat] <Nop>
nmap <Space>c [ClangFormat]
nnoremap [ClangFormat]f :<C-u>ClangFormat<CR>

" vim-easy-align
noremap [EasyAlign] <Nop>
map <Space>a [EasyAlign]
vmap [EasyAlign] <Plug>(EasyAlign)

" vim-altr
nnoremap [altr] <Nop>
nmap <Space><Space> [altr]
nmap [altr]f <Plug>(altr-forward)
nmap [altr]b <Plug>(altr-back)
