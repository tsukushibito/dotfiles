return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'onedark'
    -- end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight-night'
    -- end
  },
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
      }
    end,
  },
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    lazy = false,
    priority = 1000,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require('github-theme').setup({})
    -- end,
    init = function()
      vim.cmd.colorscheme 'github_dark_high_contrast'
    end
  },
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
  },
  {
    'rmehri01/onenord.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'glepnir/zephyr-nvim',
    lazy = false,
    priority = 1000,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
  {
    "w0ng/vim-hybrid",
    name = "hybrid",
    lazy = false,
    priority = 1000,
  },
}
