local function get_codelldb_path_and_liblldb_path()
  local mason_registry = require("mason-registry")
  local codelldb = mason_registry.get_package("codelldb")
  local extension_path = codelldb:get_install_path() .. "/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path
  if vim.fn.has("windows") == 1 then
    liblldb_path = extension_path .. "lldb/bin/liblldb.dll"
  else
    liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  end

  return codelldb_path, liblldb_path
end

return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,   -- This plugin is already lazy
  dependencies = {
    { "williamboman/mason.nvim", },
    { "mfussenegger/nvim-dap", },
  },
  config = function()
    local codelldb_path, liblldb_path = get_codelldb_path_and_liblldb_path()
    local cfg = require("rustaceanvim.config")
    local dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    }
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
      dap = dap,
    }
  end,
}
