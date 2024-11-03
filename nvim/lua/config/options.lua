-- vim設定
vim.g.mapleader = " "
vim.g.maplocalleader = '\\'

-- vim.opt.encoding = 'uft-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'uft-8'

-- vim.wo : window-scope
vim.wo.number = true
vim.wo.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true -- 右下にまだ実行していないコマンドを表示
vim.opt.cmdheight = 1
vim.opt.laststatus = 2 -- 常にステータスラインを表示
vim.opt.expandtab = true
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split' -- 文字列置換をインタラクティブに表示する
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto Indent
vim.opt.si = true -- Smart indet

vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  -- eol = '¬',
  trail = '⋅',
  --  space = '⋅',
  extends = '❯',
  precedes = '❮',
  nbsp = '%',
}

vim.opt.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Mac用設定
if vim.fn.has('mac') == 1 then
  -- クリップボード使用
  vim.opt.clipboard:append { 'unnamedplus' }
end

-- Windows用設定
if vim.fn.has('win32') == 1 then
  -- print("Use PowerShell")
  -- vim.o.shell='C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'
  -- vim.o.shellcmdflag='-c'
  -- vim.o.shellquote='\"'
  -- vim.o.shellxquote=''

  -- クリップボード使用
  vim.opt.clipboard:append { 'unnamedplus' }
end

-- VSCode用設定
if vim.g.vscode then
  local vscode = require('vscode-neovim');
  -- gTキーで前のタブに移動
  vim.keymap.set('n', 'gT', '<cmd>lua require("vscode-neovim").call("workbench.action.previousEditor")<cr>', { noremap = true, silent = true});
  -- gtキーで次のタブに移動
  vim.keymap.set('n', 'gt', '<cmd>lua require("vscode-neovim").call("workbench.action.nextEditor")<cr>', { noremap = true, silent = true});
end
