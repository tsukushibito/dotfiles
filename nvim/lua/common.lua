-- WindowsのシェルはPowerShellにしておく
if vim.fn.has('win32') == 1 then
  print("Use PowerShell")
  vim.o.shell='C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'
  vim.o.shellcmdflag='-c'
  vim.o.shellquote='\"'
  vim.o.shellxquote=''
end

-- vim設定
vim.g.mapleader = " "

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
vim.opt.showcmd = true        -- 右下にまだ実行していないコマンドを表示
vim.opt.cmdheight = 1
vim.opt.laststatus = 2        -- 常にステータスラインを表示
vim.opt.expandtab = true
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'     -- 文字列置換をインタラクティブに表示する
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true             -- Auto Indent
vim.opt.si = true             -- Smart indet

-- クリップボード使用
vim.opt.clipboard:append{'unnamedplus'}
