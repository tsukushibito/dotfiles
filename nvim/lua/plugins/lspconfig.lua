if vim.g.vscode then
  return {}
end

local on_attach = require("lsp.on_attach").on_attach
return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    lazy = true,
    dependencies = {
      { "williamboman/mason.nvim", },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          automatic_installation = true,
        },
      },
    },
    opts = {
      on_attach = on_attach,
      flags = { debounce_text_changes = 150 },
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          local ok, server_config = pcall(require, "lsp.servers." .. server_name)
          if ok then
            server_config.setup(opts)
          else
            if server_name == "rust_analyzer" then
              require("lspconfig")[server_name] = {}
            else
              require("lspconfig")[server_name].setup(opts)
            end
          end
        end,
      }
    end,
  },
}
