scriptencoding utf-8
" echom '[vim-clang-format]'
if neobundle#is_installed('vim-clang-format')
    let g:clang_format#style_options = {
        \ "BasedOnStyle" : "LLVM",
        \ "AllowShortIfStatementsOnASingleLine" : "true",
        \ "AlwaysBreakTemplateDeclarations" : "true",
        \ "BreakConstructorInitializersBeforeComma" : "true",
        \ "IndentWidth" : 4,
        \ "TabWidth" : 4,
        \ "AccessModifierOffset" : -4,
        \ "SpacesInAngles" : "true",
        \ "ColumnLimit" : 130,
        \ "Standard" : "C++11"}
endif
