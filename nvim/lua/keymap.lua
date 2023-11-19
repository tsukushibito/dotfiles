local keymap = vim.keymap
-- キーバインド
-- 画面分割
local option = { noremap = true, silent = true, }

-- 設定ファイルを開く
keymap.set('n', '<F1>', ':edit $MYVIMRC<CR>', option)
