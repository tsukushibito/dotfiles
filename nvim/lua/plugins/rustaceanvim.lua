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
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>,", function()
            vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/plugins/rustaceanvim.lua")
          end, { silent = true, desc = "Open rustaceanvim.lua" })
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { silent = true, buffer = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          }
        },
      }
    }
  end,
}
