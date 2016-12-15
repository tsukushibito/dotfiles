nnoremap [VimFiler] <Nop>
nmap <Space>f [VimFiler]
if has('win32')
    nnoremap [VimFiler] :<C-u>VimFilerCurrentDir -split -simple -winwidth=40 -force-quit -toggle<CR>
else
    nnoremap [VimFiler] :<C-u>VimFilerCurrentDir -split -simple -winwidth=45 -force-quit -toggle<CR>
endif
