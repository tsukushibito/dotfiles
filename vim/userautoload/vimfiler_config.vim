nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
if has('win32')
    nnoremap [VimFiler] :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -no-quit -toggle<CR>
else
    nnoremap [VimFiler] :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -no-quit -toggle<CR>
endif
