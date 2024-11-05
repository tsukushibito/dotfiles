-- VSCode用設定
if vim.g.vscode then
  local vscode = require("vscode");
  vim.keymap.set("n", "<S-h>", "<cmd>lua require('vscode').call('workbench.action.previousEditor')<cr>",
    { noremap = true, silent = true });
  vim.keymap.set("n", "<S-l>", "<cmd>lua require('vscode').call('workbench.action.nextEditor')<cr>",
    { noremap = true, silent = true });
end