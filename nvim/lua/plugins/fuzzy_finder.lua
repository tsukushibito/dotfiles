-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    { '<leader>?',       '<cmd>Telescope oldfiles<cr>',     desc = '[?] Find recently opened files' },
    { '<leader><space>', '<cmd>Telescope buffers<cr>',      desc = '[ ] Find existing buffers' },
    { '<leader>gf',      '<cmd>Telescope git_files<cr>',    desc = 'Search [G]it [F]iles' },
    { '<leader>sf',      '<cmd>Telescope find_files<cr>',   desc = '[S]earch [F]iles' },
    { '<leader>sh',      '<cmd>Telescope help_tags<cr>',    desc = '[S]earch [H]elp' },
    { '<leader>sw',      '<cmd>Telescope grep_string<cr>',  desc = '[S]earch current [W]ord' },
    { '<leader>sg',      '<cmd>Telescope live_grep<cr>',    desc = '[S]earch by [G]rep' },
    { '<leader>sG',      '<cmd>LiveGrepGitRoot<cr>',        desc = '[S]earch by [G]rep on Git Root' },
    { '<leader>sd',      '<cmd>Telescope diagnostics<cr>',  desc = '[S]earch [D]iagnostics' },
    { '<leader>sr',      '<cmd>Telescope resume<cr>',       desc = '[S]earch [R]esume' },
    { '<leader>/',       '<cmd>FuzzilySearch<cr>',          desc = '[/] Fuzzily search in current buffer', },
    { '<leader>e',       '<cmd>Telescope file_browser<cr>', desc = 'File browser', },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          -- mappings = {
          --   ["i"] = {
          --     -- your custom insert mode mappings
          --   },
          --   ["n"] = {
          --     -- your custom normal mode mappings
          --   },
          -- },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    require('telescope').load_extension 'fzf'

    -- Telescope live_grep in git root
    -- Function to find the git root directory based on the current buffer's path
    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == "" then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
      end

      -- Find the Git root directory from the current file's path
      local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")
          [1]
      if vim.v.shell_error ~= 0 then
        print("Not a git repository. Searching on current working directory")
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        require('telescope.builtin').live_grep({
          search_dirs = { git_root },
        })
      end
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

    local function fuzzily_search_in_current_buffer()
      require('telescope.builtin').current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown
        {
          winblend = 10,
          previewer = false,
        })
    end
    vim.api.nvim_create_user_command('FuzzilySearch', fuzzily_search_in_current_buffer, {})

    -- Enable file_browser extension
    require("telescope").load_extension "file_browser"
  end
}
