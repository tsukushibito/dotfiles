syntax enable
set background=dark
colorscheme solarized
set showtabline=2
if has('win32')
    set guifont=MS_ゴシック:h14
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
    autocmd GUIEnter * set transparency=200
    autocmd FocusGained * set transparency=200
    autocmd FocusLost * set transparency=127
else    
    autocmd GUIEnter * set transparency=10
    autocmd FocusGained * set transparency=10
    autocmd FocusLost * set transparency=50
endif
