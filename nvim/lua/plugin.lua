-- lazy.nvimのインストール
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Install lazy.nvim")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>e', ':NvimTreeToggle<CR>' }
    },
    config = function()
      require("nvim-tree").setup({
      })
    end
  },
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<leader>t', ':ToggleTerm<CR>' }
    },
    config = true
  },
  {
    'phaazon/hop.nvim',
    keys = {
      { '<leader>f', ':HopChar2MW<CR>' }
    },
    config = function()
      require('hop').setup()
    end}
})
