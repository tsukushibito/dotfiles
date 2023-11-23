return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
    'nvim-telescope/telescope-frecency.nvim'
  },
  keys = {
    { '<leader>T' }
  },
  config = function()
    require('telescope').setup()
    require('telescope').load_extension 'frecency'

    local opts = {
      mode = "n",       -- NORMAL mode
      buffer = nil,     -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,    -- use `silent` when creating keymaps
      noremap = true,   -- use `noremap` when creating keymaps
      nowait = true,    -- use `nowait` when creating keymaps
    }

    local mappings = {
      ["<leader>"] = {
        T = {
          name = "+telescope",
          m     = { "<cmd>Telescope harpoon marks<cr>",             "Search Harpoons" },
          f     = { '<cmd>Telescope find_files<cr>',                "Find Files" },
          g     = { '<cmd>Telescope live_grep<cr>',                 "Grep" },
          o     = { '<cmd>Telescope oldfiles<cr>',                  "Recently Opened" },
          h     = { '<cmd>Telescope help_tags<cr>',                 "Nvim help" },
          k     = { '<cmd>Telescope keymaps<cr>',                   "Keymaps" },
          C     = { '<cmd>Telescope git_commits<cr>',               "Git Commits" },
          F     = { '<cmd>Telescope frecency<cr>',                  "Frecency" },
          r     = { '<cmd>Telescope resume<cr>',                    "Resume" },
          p     = { '<cmd>Telescope projects<cr>',                  "Projects" },
          H     = { '<cmd>Telescope highlights<cr>',                "Highlights" },
          j     = { '<cmd>Telescope jumplist<cr>',                  "jumplist" },
          c     = { '<cmd>Telescope commands<cr>',                  "Execute" },
          ["/"] = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', "Search in File" },
          ["?"] = { '<cmd>Telescope search_history<cr>',            "History" },
          [";"] = { '<cmd>Telescope command_history<cr>',           "Command History" },
        },
      },
    }
    require('which-key').register(mappings, opts)
  end
}
