-- VSCode用設定
-- g:vscodeが存在する場合のみマッピングを設定
if vim.g.vscode then
  -- gTキーを押したときのマッピング
  vim.api.nvim_set_keymap('n', 'gT', "<cmd>lua VSCodeNotify('workbench.action.previousEditor')<cr>", { noremap = true, silent = true })

  -- gtキーを押したときのマッピング
  vim.api.nvim_set_keymap('n', 'gt', "<cmd>lua VSCodeNotify('workbench.action.nextEditor')<cr>", { noremap = true, silent = true })
end
