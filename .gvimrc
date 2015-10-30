syntax enable
set background=dark
let g:solarized_italic=0

" if neobundle#is_installed('void.vim')
"    colorscheme void
" if neobundle#is_installed('vim-late_evening')
"    colorscheme late_evening
" if neobundle#is_installed('vim-hybrid-material')
"    colorscheme hybrid_reverse
" if neobundle#is_installed('meta5')
"    colorscheme meta5
" if neobundle#is_installed('vilight.vim')
"    colorscheme vilight
" if neobundle#is_installed('evening_vim')
"    colorscheme evening
" if neobundle#is_installed('vim-colors-solarized')
"    colorscheme solarized
if neobundle#is_installed('vim-hybrid')
   colorscheme hybrid
else
endif

set showtabline=2
if has('win32')
    set guifont=Consolas:h11
    set guifontwide=MS_Gothic:h11
else
    set guifont=Ricty:h14
endif
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

if has('win32')
    autocmd GUIEnter * set transparency=255
    autocmd FocusGained * set transparency=255
    autocmd FocusLost * set transparency=255
else    
    autocmd GUIEnter * set transparency=10
    autocmd FocusGained * set transparency=10
    autocmd FocusLost * set transparency=20
endif
