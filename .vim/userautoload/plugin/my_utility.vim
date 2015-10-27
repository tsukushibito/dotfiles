let s:uuidString=""
function! MY_GenerateUuidString()
python << EOF
import vim, uuid
uuidString = uuid.uuid4().hex
vim.command(':let s:uuidString = "' + uuidString + '"')
EOF
endfunction

function! MY_GetUuidString()
    return s:uuidString
endfunction
