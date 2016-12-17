syntax enable
set background=dark

set showtabline=2
if has('win32')
    set guifont=Consolas:h10
    set guifontwide=MS_Gothic:h10
else
    set guifont=Ricty:h16
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

colorscheme solarized
