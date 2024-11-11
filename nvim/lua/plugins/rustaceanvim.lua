local function get_codelldb_adapter()
  local mason_registry = require("mason-registry")
  local codelldb = mason_registry.get_package("codelldb")
  local extension_path = codelldb:get_install_path() .. "/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path
  if vim.fn.has("windows") == 1 then
    liblldb_path = extension_path .. "lldb/bin/liblldb.dll"
  elseif vim.fn.has("mac") == 1 then
    liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
  else
    liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  end

  return {
    type = 'server',
    -- port = "${port}",
    port = "13000",
    host = '127.0.0.1',
    executable = {
      command = codelldb_path,
      -- args = { '--liblldb', liblldb_path, '--port', '${port}' },
      args = { '--port', '13000' },
    },
  }
end

return {
  "mrcjkb/rustaceanvim",
  cond = not vim.g.vscode,
  version = "^5", -- Recommended
  lazy = false,   -- This plugin is already lazy
  dependencies = {
    { "williamboman/mason.nvim", },
    { "mfussenegger/nvim-dap", },
  },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          require("lsp.on_attach").on_attach(client, bufnr)
          -- local args = vim.g.rustaceanvim.dap.adapter.executable.args
          -- print("vim.g.rustaceanvim.dap.adapter.executable.args: " .. args[1] .. " " .. args[2])
          -- local opts = { noremap = true, silent = true, buffer = bufnr }
        end,
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
      dap = {
        adapter = get_codelldb_adapter(),
      },
    }
  end,
}
