" call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts',
      \ ['--nocolor', '--nogroup'])

nnoremap [Denite] <Nop>
nmap <Space>d [Denite]
nnoremap [Denite]f :<C-u>Denite file_rec<CR>
nnoremap [Denite]g :<C-u>Denite grep<CR>
nnoremap [Denite]l :<C-u>Denite line<CR>
nnoremap [Denite]u :<C-u>Denite file_mru<CR>
nnoremap [Denite]y :<C-u>Denite neoyank<CR>

