-- lazy.nvimのインストール
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  print('Install lazy.nvim')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('plugin.colorscheme'),
  require('plugin.nvim-tree'),
  require('plugin.toggleterm'),
  require('plugin.hop'),
  require('plugin.telescope'),
  require('plugin.nvim-lspconfig'),
  require('plugin.mason-lspconfig'),
  require('plugin.nvim-cmp'),
  require('plugin.nvim-dap'),
  require('plugin.rust-tools'),
  require('plugin.which-key'),
  require('plugin.lualine'),
  require('plugin.bufferline'),
  require('plugin.indent-blankline'),
  require('plugin.nvim-treesitter'),
})
