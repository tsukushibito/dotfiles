return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    require("lspconfig").lua_ls.setup {}
    require("lspconfig").rust_analyzer.setup {}

  end
}
