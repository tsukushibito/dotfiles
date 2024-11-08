return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,   -- This plugin is already lazy
  dependencies = {
    { "mfussenegger/nvim-dap", },
  },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = require("lsp.on_attach").on_attach,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
            hoverActions = { enable = true },
          }
        },
      },
      tools = {
        float_win_config = {
          border = "rounded",
        },
      },
    }
  end,
}
