scriptencoding utf-8
" echom '[mapping.vim]'
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

" 現在のバッファのファイル場所をカレントディレクトリに設定
nnoremap <Space>cd :cd %:h<CR>

" QuickFix用
nnoremap [QuickFix] <Nop>
nmap <Space>q [QuickFix]
nnoremap [QuickFix]j  :cnext<Return>
nnoremap [QuickFix]k  :cprevious<Return>
nnoremap [QuickFix]r  :crewind<Return>
nnoremap [QuickFix]K  :cfirst<Return>
nnoremap [QuickFix]J  :clast<Return>
nnoremap [QuickFix]f  :cnfile<Return>
nnoremap [QuickFix]F  :cpfile<Return>
nnoremap [QuickFix]l  :clist<Return>
nnoremap [QuickFix]q  :cc<Return>
nnoremap [QuickFix]o  :copen<Return>
nnoremap [QuickFix]c  :cclose<Return>
nnoremap [QuickFix]w  :cwindow<Return>
nnoremap [QuickFix]p  :colder<Return>
nnoremap [QuickFix]n  :cnewer<Return>
nnoremap [QuickFix]m  :make<Return>
nnoremap [QuickFix]M  :make<Space>
nnoremap [QuickFix]g  :grep<Space>

" vimgrep用
nnoremap [VimGrep] <Nop>
nmap <Space>g [VimGrep]
noremap <expr> [VimGrep] ':vimgrep /' . expand('<cword>') . '/ ' 


" Unite {{{1
nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap [Unite]b :<C-u>Unite -auto-resize -direction=dynamicbottom buffer<CR>
nnoremap [Unite]f :<C-u>Unite -auto-resize -direction=dynamicbottom file<CR>
nnoremap [Unite]m :<C-u>Unite -auto-resize -direction=dynamicbottom file_mru<CR>


" VimFiler {{{1
nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
" nnoremap [VimFiler] :<C-u>VimFilerTab -simple<CR>
if has('win32')
    nnoremap [VimFiler] :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -force-quit -toggle<CR>
else
    nnoremap [VimFiler] :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -force-quit -toggle<CR>
endif
" nnoremap [VimFiler]d :<C-u>VimFilerDouble -toggle<CR>

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

" vim-operator-replace {{{1
nnoremap [operator-replace] <Nop>
nmap _ [operator-replace]
nmap [operator-replace] <Plug>(operator-replace)


" vim-altr {{{1
nnoremap [altr] <Nop>
nmap <Space>s [altr]
nmap [altr]f <Plug>(altr-forward)
nmap [altr]b <Plug>(altr-back)

" vim-easymotion {{{1
nnoremap [EasyMotion] <Nop>
nmap <Space>m [EasyMotion]
nmap [EasyMotion] <Plug>(easymotion-s2)
" }}}
" DoxygenToolkit {{{1
nnoremap [DoxygenToolkit] <Nop>
nmap <Space>d [DoxygenToolkit]
nmap [DoxygenToolkit] <C-u>:Dox<CR>
" }}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
