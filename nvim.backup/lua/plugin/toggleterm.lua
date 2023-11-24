  return {
    'akinsho/toggleterm.nvim',
    dependencies = {
     'folke/which-key.nvim',
    },
    keys = {
      { '<leader>t', },
    },
    config = function ()
      require('toggleterm').setup()
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])

      local opts = {
        mode = "n",       -- NORMAL mode
        buffer = nil,     -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,    -- use `silent` when creating keymaps
        noremap = true,   -- use `noremap` when creating keymaps
        nowait = true,    -- use `nowait` when creating keymaps
      }

      local mappings = {
        ["<leader>"] = {
          t = {
            name = '+toggleterm',
            h    = { '<cmd>ToggleTerm direction=horizontal<cr>',       'Horizontal' },
            v    = { '<cmd>ToggleTerm size=40 direction=vertical<cr>', 'Vertical' },
            f    = { '<cmd>ToggleTerm direction=float<cr>',            'Float' },
            t    = { '<cmd>ToggleTerm direction=tab<cr>',              'Tab' },
          },
        },
      }
      require('which-key').register(mappings, opts)
    end
  }
