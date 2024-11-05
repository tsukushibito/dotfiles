local M = {}

M.on_attach = function(client, bufnr)
  -- バッファーごとの設定
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- キーマッピングの設定
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find References" }))
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition,
    vim.tbl_extend("force", opts, { desc = "Go to Type Definition" }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help,
    vim.tbl_extend("force", opts, { desc = "Signature Help" }))
  vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float,
    vim.tbl_extend("force", opts, { desc = "Show Diagnostics" }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
  vim.keymap.set('n', '<leader>ih', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local current_setting = vim.lsp.inlay_hint.is_enabled({ bufnr })
    vim.lsp.inlay_hint.enable(not current_setting, { bufnr })
  end, { noremap = true, silent = true, desc = "Toggle Inlay Hints" })

  -- 手動フォーマットのキーマッピング
  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
  end, vim.tbl_extend("force", opts, { desc = "Format Document" }))

  -- 保存時にフォーマットを自動実行
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

return M
