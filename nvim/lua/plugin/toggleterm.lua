  return {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>' },
      { '<leader>tv', '<Cmd>ToggleTerm size=40 direction=vertical<CR>' },
      { '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>' },
      { '<leader>tt', '<Cmd>ToggleTerm direction=tab<CR>' },
    },
    config = function ()
      require('toggleterm').setup()
      local opts = {}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end
  }
