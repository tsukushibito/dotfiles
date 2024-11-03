return {
  { "nvim-tree/nvim-web-devicons", },
  {
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
    opts = {
      options = {
        icons_enabled = false,
        theme = "tokyonight",
        component_separators = "|",
        section_separators = "",
      },
    },
  },
}
