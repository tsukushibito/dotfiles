" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap [Unite]f :<C-u>Unite file_rec<CR>
nnoremap [Unite]b :<C-u>Unite buffer<CR>
nnoremap [Unite]g :<C-u>Unite grep<CR>
nnoremap [Unite]l :<C-u>Unite line<CR>
nnoremap [Unite]u :<C-u>Unite file_mru<CR>
nnoremap [Unite]y :<C-u>Unite neoyank<CR>
