scriptencoding utf-8
" echom '[vim-marching.vim]'
if neobundle#is_installed('vim-marching')
    " clang コマンドの設定
    if has('win32')
        let g:marching_clang_command = "C:/clang.exe"
    else
        let g:marching_clang_command = "/usr/bin/clang"
    endif

    " オプションを追加する場合
    " filetype をキーに持つ辞書に設定する
    let g:marching#clang_command#options = {
    \   "cpp" : "-std=gnu++1y"
    \}

    let g:marching_clang_command_option="-std=c++1y"

    " インクルードディレクトリのパスを設定
    let g:marching_include_paths = [
    \   "C:/MinGW/lib/gcc/mingw32/4.6.2/include/c++",
    \   "C:/cpp/boost",
    \   "Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1",
    \   "~/Documents/GitHub/TempuraEngine/Source"
    \]

    " neocomplete.vim と併用して使用する場合
    let g:marching_enable_neocomplete = 1

    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    
    " 処理のタイミングを制御する
    set updatetime=200

    " オムニ補完時に補完ワードを挿入したくない場合
    imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
endif
