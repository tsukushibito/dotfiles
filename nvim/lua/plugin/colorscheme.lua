return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
  },
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    config = function()
      vim.cmd[[colorscheme vscode]]
    end
  },
}
