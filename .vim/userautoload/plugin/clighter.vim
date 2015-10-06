echom '[clighter.vim]'
if neobundle#is_installed('clighter')
    if has('win32')
        let g:clighter_libclang_file = 'C:\Program Files (x86)\LLVM\bin\libclang.dll'
    else
        let g:clighter_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
    endif
endif
