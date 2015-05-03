set encoding=utf-8
set nocompatible

" 画面表示の設定

set number         " 行番号を表示する
"set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:>\ ,extends:❯,precedes:❮

" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=2

" コマンドラインの設定

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" ビープの設定

"ビープ音すべてを無効にする
"set visualbell t_vb=
"set noerrorbells "エラーメッセージの表示時にビープを鳴らさない


" 括弧、クォートの補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi{<C-R>z}<ESC>
"vnoremap [ "zdi[<C-R>z]<ESC>
"vnoremap ( "zdi(<C-R>z)<ESC>
"vnoremap " "zdi"<C-R>z"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
if has('win32')
    set runtimepath+=$HOME\.vim\bundle\neobundle.vim\
else
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
" NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neocomplete.vim'

if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
endif

call neobundle#end()

"NeoCompleteEnable
let g:neocomplete#enable_at_startup = 1

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'vim-scripts/TagHighlight'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'scrooloose/nerdtree'

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
"NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

" 編集中のバッファのファイルのディレクトリに移動
":cd %:h

" 自作プラグインディレクトリ追加
set runtimepath+=~/.vim/plugin/

" doxygen-supportディレクトリ追加
set runtimepath+=~/.vim/doxygen-support/doxygen-support/

" ファイルタイプ設定
au BufRead,BufNewFile *.gyp set filetype=python
au BufRead,BufNewFile *.gypi set filetype=pytyon
au BufRead,BufNewFile *.mm set filetype=cpp

" filetype=cpp が設定された時に呼ばれる関数
"Vim で C++ の設定を行う場合はこの関数内で記述する
" ここで設定する項目は各自好きに行って下さい
function! s:cpp()
    " インクルードパスを設定する
    " gf などでヘッダーファイルを開きたい場合に影響する
if has('mac')
    setlocal path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
endif
    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>
endfunction


augroup vimrc-cpp
    autocmd!
    " filetype=cpp が設定された場合に関数を呼ぶ
    autocmd FileType cpp call s:cpp()
augroup END

" grepの結果をQuickfixにフック
autocmd QuickFixCmdPost *grep* cwindow

" 挿入モード終了時にSyntasticCheck実行
augroup AutoClangFormatAndSyntasticCheck
    autocmd!
    autocmd InsertLeave * call s:syntastic() 
augroup END
function! s:syntastic()
"    ClangFormat
    SyntasticCheck
endfunction

" VimFilerのEdit動作のカスタマイズ
let g:vimfiler_edit_action = 'tabopen'

" Gtagsの自動更新を有効化
let Gtags_Auto_Update = 1

" auto-ctagsの自動更新を有効化
let g:auto_ctags = 1

" 起動時にUpdateTypesFileを実行
augroup UpdateTagHighlightTypeFile
    autocmd!
    autocmd VimEnter * call s:updateFileType()
augroup END
function! s:updateFileType()
    "UpdateTypesFile
endfunction

" Quickfixのキーマッピング
map <C-N> :cn<CR>
map <C-P> :cp<CR>

" Uniteのキーマッピング
noremap <silent> ,ub :<C-U>Unite buffer<CR>
noremap <silent> ,uf :<C-U>Unite file<CR>

" ClangFormatのキーマッピング
noremap <C-_> :ClangFormat<CR>

" Gtagsのキーマッピング
noremap <C-J> :GtagsCursor<CR>
noremap <C-K> :Gtags -r<CR><CR>

" その他のキーマッピング
noremap <F2> :e ~/.vimrc<CR>
noremap <F5> :QuickRun<CR>

" Doxygenの行末用コメント挿入コマンド
function! s:doxMember()
    :let comment = " /**< */"
    :execute ":normal A".comment
    :normal F*
    :normal i 
    :startinsert
endfunction
command! -nargs=0 DoxMember call s:doxMember()

noremap ,dd :Dox<CR>
noremap ,dm :DoxMember<CR>
