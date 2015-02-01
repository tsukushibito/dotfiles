" Vim global plugin for correcting typing mistakes
" Last Change: 2014/10/15
" Maintainer: tsukushibito
" License: This file is placed in the public domain.

let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_incguard")
  finish
endif
let g:loaded_incguard = 1

function! s:IncGuardFunc()
echo "start function."
python << EOF
import vim, uuid
uuidString = uuid.uuid4().hex
currentBuffer = vim.current.buffer
currentBuffer.append("#pragma once", 0)
currentBuffer.append("#ifndef GUARD_" + uuidString, 1)
currentBuffer.append("#define GUARD_" + uuidString, 2)
currentBuffer.append("#endif // GUARD_" + uuidString)
EOF
endfunction
command!  -nargs=0 IncGuard call s:IncGuardFunc()


let &cpo = s:save_cpo
unlet s:save_cpo
