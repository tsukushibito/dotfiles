return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function ()
    require("dapui").setup()

    vim.keymap.set('n', '<F5>', ':DapContinue<CR>', { silent = true, })
    vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { silent = true })
    vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { silent = true })
    vim.keymap.set('n', '<F12>', ':DapStepOut<CR>', { silent = true })
    vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
    vim.keymap.set('n', '<leader>B',
      ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>',
      { silent = true, desc = 'Set breakpoint with condition' })
    vim.keymap.set('n', '<leader>lp',
      ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      { silent = true, desc = 'Set breakpoint with log point message' })
    vim.keymap.set('n', '<leader>dr', ':lua require("dap").repl.open()<CR>',
      { silent = true, desc = 'Open REPL'})
    vim.keymap.set('n', '<leader>dl', ':lua require("dap").run_last()<CR>',
      { silent = true, desc = 'Run last'})

    vim.keymap.set('n', '<leader>du', ':lua require("dapui").toggle()<CR>',
      { silent = true, desc = 'Toggle DAPUI'} )
    vim.keymap.set('n', '<leader>de', ':lua require("dapui").eval()<CR>',
      { silent = true, desc = 'Eval (DAPUI)'})
  end
}
