if vim.g.vscode then
  return
end

local on_attach = require("lsp.on_attach").on_attach
return {
  { "williamboman/mason.nvim", lazy = true, },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
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
            require("lspconfig")[server_name].setup(opts)
          end
        end,
      }
    end,
  },
}
