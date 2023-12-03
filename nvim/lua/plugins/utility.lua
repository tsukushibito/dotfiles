return {
  {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
  },

  {
    'phaazon/hop.nvim',
    keys = {
      { '<leader>f', '<Cmd>HopChar2MW<CR>', desc = 'HopChar2MW' },
    },
    config = function()
      require('hop').setup()
    end
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'solarized-osaka',
        component_separators = '|',
        section_separators = '',
      },
    },
    event = 'VeryLazy',
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          mode = "tabs",
        },
      })
    end,
    event = 'VeryLazy',
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    event = 'VeryLazy',
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
    event = 'VeryLazy',
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>E', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTreeToggle' }
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          float = {
            enable = false,
          },
        },
      })
    end
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    event = 'VeryLazy',
    config = function()
      -- [[ Configure Treesitter ]]
      -- See `:help nvim-treesitter`
      -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
      vim.defer_fn(function()
        require('nvim-treesitter.configs').setup {
          -- Add languages to be installed here that you want installed for treesitter
          ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

          -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
          auto_install = false,

          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = '<c-space>',
              node_incremental = '<c-space>',
              scope_incremental = '<c-s>',
              node_decremental = '<M-space>',
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
              },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
              },
              goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
              },
              goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
              },
              goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
              },
            },
            swap = {
              enable = true,
              swap_next = {
                ['<leader>a'] = '@parameter.inner',
              },
              swap_previous = {
                ['<leader>A'] = '@parameter.inner',
              },
            },
          },
        }
      end, 0)
    end
  },

  {
    'akinsho/toggleterm.nvim',
    dependencies = {
      {
        'folke/which-key.nvim',
        optional = true,
        opts = {
          defaults = {
            ["<leader>t"] = { name = "ToggleTerm" },
          },
        },
      }
    },
    keys = {
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>',       desc = 'Horizontal' },
      { '<leader>tv', '<cmd>ToggleTerm size=40 direction=vertical<cr>', desc = 'Vertical' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>',            desc = 'Float' },
      { '<leader>tt', '<cmd>ToggleTerm direction=tab<cr>',              desc = 'Tab' },
    },
    config = function()
      require('toggleterm').setup()
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])
    end
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'InsertEnter',
    config = function()
      require('nvim-surround').setup({
      })
    end
  },
}
