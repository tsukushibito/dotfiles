local lspconfig = require("lspconfig")

local M = {}

M.setup = function(opts)
  lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", opts, {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true), -- Neovimのランタイムファイルをインポート
        },
        telemetry = {
          enable = false, -- 不要なテレメトリを無効化
        },
      },
    },
  }))
end

return M
