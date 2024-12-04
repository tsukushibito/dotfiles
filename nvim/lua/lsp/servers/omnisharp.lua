local lspconfig = require("lspconfig")

local M = {}

M.setup = function(opts)
  lspconfig.omnisharp.setup(vim.tbl_deep_extend("force", opts, {
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_dir = require('lspconfig.util').root_pattern("*.sln", "*.csproj", ".git"),
  }))
end

return M
