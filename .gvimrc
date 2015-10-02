syntax enable
set background=dark
let g:solarized_italic=0
colorscheme solarized
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
    autocmd FocusLost * set transparency=50
endif
