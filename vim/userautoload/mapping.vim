scriptencoding utf-8
" echom '[mapping.vim]'
" 基本機能に対するマッピング {{{1
" コンフィグ用
nnoremap [Config] <Nop>
nmap <Space>c [Config]
nnoremap [Config]b  :<C-u>e ~/.config/vim/userautoload/basic.vim<Return>
nnoremap [Config]m  :<C-u>e ~/.config/vim/userautoload/mapping.vim<Return>
nnoremap [Config]d  :<C-u>e ~/.config/vim/userautoload/dein/dein.toml<Return>

" 現在のバッファを再読み込み
noremap <F2> :<C-u>source %<CR>

" 現在のバッファのファイル場所をカレントディレクトリに設定
nnoremap <F3> :<C-u>cd %:h<CR>

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
nnoremap <C-n> :cnext<Return>
nnoremap <C-p> :cprevious<Return>

" vimgrep用
nnoremap [VimGrep] <Nop>
nmap <Space>g [VimGrep]
noremap <expr> [VimGrep] ':Ag '. expand('<cword>') 
" }}}

