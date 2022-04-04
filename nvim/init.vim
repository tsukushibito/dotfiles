let mapleader = "\<Space>" 

" WindowsのシェルはPowerShellにしておく
if has('win32')
  set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
  set shellcmdflag=-c
  set shellquote=\"
  set shellxquote=
endif

" vim-plugが無ければインストール
let s:xdg_data_home = getenv('XDG_DATA_HOME')
let s:vimplut_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if has("mac") || has("unix")
  if s:xdg_data_home is v:null
    let s:xdg_data_home = $HOME . '/.local/share'
  endif 
  let s:plug_path = s:xdg_data_home . '/nvim/site/autoload/plug.vim'
  let s:command = 'curl -fLo ' . s:plug_path . ' --create-dirs ' . s:vimplut_url

elseif has("win32")
  if s:xdg_data_home is v:null
    let s:xdg_data_home = $LOCALAPPDATA
  endif
  let s:plug_path = s:xdg_data_home . '/nvim-data/site/autoload/plug.vim'
  let s:command = 'iwr -useb ' . s:vimplut_url . ' | ni "' . s:plug_path . '" -Force'

endif

if empty(glob(s:plug_path))
  call system(s:command)
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" プラグイン設定
call plug#begin()
Plug 'asvetliakov/vim-easymotion'
call plug#end()

" vim設定
set ignorecase
set smartcase

" キーマッピング
nmap <Leader>f <Plug>(easymotion-s2)

" VSCode用設定
if exists('g:vscode')
  nmap gT <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  nmap gt <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
endif
