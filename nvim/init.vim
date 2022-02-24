let mapleader = "\<Space>" 
let s:xdg_data_home = getenv('XDG_DATA_HOME')

" vim-plug なかったら落としてくる
if has("mac") || has("unix")
  if s:xdg_data_home is v:null
    let s:xdg_data_home = $HOME . '/.local/share'
  endif 

  let s:plug_path = s:xdg_data_home . '/nvim/site/autoload/plug.vim'
  let s:vimplut_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let s:command = 'curl -fLo ' . s:plug_path . ' --create-dirs ' . s:vimplut_url
elseif has("win32")
  if s:xdg_data_home is v:null
    let s:xdg_data_home = $LOCALAPPDATA
  endif

  let s:plug_path = s:xdg_data_home . 'nvim-data/site/autoload/plug.vim'
  let s:command = 'iwr -useb ' . s:vimplut_url . ' | ni "' . s:plug_path . '" -Force'
endif

if empty(glob(s:plug_path))
  call system(s:command)
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'asvetliakov/vim-easymotion'
call plug#end()

if exists('g:vscode')
  nmap gT <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  nmap gt <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
endif

nmap <Leader>f <Plug>(easymotion-s2)
