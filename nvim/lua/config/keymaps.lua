vim.keymap.set("n", "<leader>qo", ":copen<CR>", { noremap = true, silent = true, desc = "Open QuickFix" })
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { noremap = true, silent = true, desc = "Close QuickFix" })
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { noremap = true, silent = true, desc = "Next QuickFix Item" })
vim.keymap.set("n", "<leader>qp", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous QuickFix Item" })

-- VSCode用設定
if vim.g.vscode then
  local vscode = require("vscode");
  vim.keymap.set("n", "<S-h>", "<cmd>lua require('vscode').call('workbench.action.previousEditor')<cr>",
    { noremap = true, silent = true });
  vim.keymap.set("n", "<S-l>", "<cmd>lua require('vscode').call('workbench.action.nextEditor')<cr>",
    { noremap = true, silent = true });
end
