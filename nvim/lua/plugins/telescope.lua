return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    cond = not vim.g.vscode,
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim", },
      { "nvim-telescope/telescope-file-browser.nvim", },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",    desc = "Help Tags" },
      { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
    },
    config = function()
      local telescope = require("telescope")
      local themes = require("telescope.themes")
      -- local actions = require('telescope.actions')
      telescope.setup {
        defaults = themes.get_dropdown {
        },
        extensions = {
          file_browser = {
            initial_mode = "normal",
            hijack_netrw = true,
          },
        },
      }
      telescope.load_extension('file_browser')
    end,
  },
}
