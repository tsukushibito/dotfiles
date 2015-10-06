scriptencoding utf-8
echom '[mapping.vim]'
" 基本機能に対するマッピング {{{1
" .vimrcの編集
noremap <F2> :<C-u>tabedit ~/.vimrc<CR> 
" .vim/userautoloadをVimFilerで開く
if has('win32')
    noremap <F3> :<C-u>cd $HOME<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit -toggle $HOME/.vim/userautoload<CR>
else
    noremap <F3> :<C-u>cd ~<CR>:<C-u>VimFiler -split -simple -winwidth=45 -no-quit -toggle ~/.vim/userautoload<CR>
end
" 現在のバッファを再読み込み
noremap <F4> :<C-u>source %<CR>

" QuickFix用
nnoremap Q q
nnoremap qj  :cnext<Return>
nnoremap qk  :cprevious<Return>
nnoremap qr  :crewind<Return>
nnoremap qK  :cfirst<Return>
nnoremap qJ  :clast<Return>
nnoremap qf  :cnfile<Return>
nnoremap qF  :cpfile<Return>
nnoremap ql  :clist<Return>
nnoremap qq  :cc<Return>
nnoremap qo  :copen<Return>
nnoremap qc  :cclose<Return>
nnoremap qw  :cwindow<Return>
nnoremap qp  :colder<Return>
nnoremap qn  :cnewer<Return>
nnoremap qm  :make<Return>
nnoremap qM  :make<Space>
nnoremap qg  :grep<Space>
nnoremap q   <Nop>

" Unite {{{1
nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap [Unite]b :<C-u>Unite -auto-resize -direction=dynamicbottom buffer<CR>

" VimFiler {{{1
nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
if has('win32')
    nnoremap [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -no-quit -toggle<CR>
else
    nnoremap [VimFiler]s :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -no-quit -toggle<CR>
endif
nnoremap [VimFiler]d :<C-u>VimFilerDouble -toggle<CR>

" Neosnippet {{{1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ClangFormat {{{1
nnoremap [ClangFormat] <Nop>
nmap <Space>c [ClangFormat]
nnoremap [ClangFormat]f :<C-u>ClangFormat<CR>

" vim-easy-align {{{1
noremap [EasyAlign] <Nop>
map <Space>a [EasyAlign]
vmap [EasyAlign] <Plug>(EasyAlign)

" vim-altr {{{1
nnoremap [altr] <Nop>
nmap <Space><Space> [altr]
nmap [altr]f <Plug>(altr-forward)
nmap [altr]b <Plug>(altr-back)
" }}}
" vim-easymotion {{{1
nnoremap [EasyMotion] <Nop>
nmap <Space>e [EasyMotion]
nmap [EasyMotion] <Plug>(easymotion-s2)
" }}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
