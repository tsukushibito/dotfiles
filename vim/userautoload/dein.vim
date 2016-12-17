" echom 'dein.vim'
" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/vim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    " echom 'clone dein'
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
" let &runtimepath = s:dein_repo_dir .",". &runtimepath
" echom s:dein_repo_dir
execute "set runtimepath+=".s:dein_repo_dir
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein/dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}

colorscheme solarized
