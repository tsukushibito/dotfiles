return {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
    'akinsho/toggleterm.nvim',
  },
  ft = 'rust',
  config = function()
    -- Update this path
    local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    local this_os = vim.loop.os_uname().sysname;

    -- The path in windows is different
    if this_os:find "Windows" then
      codelldb_path = extension_path .. "adapter\\codelldb.exe"
      liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    else
      -- The liblldb extension is .so for linux and .dylib for macOS
      liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
    end

    local opts = {
      tools = { -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix / toggleterm / vimux
        executor = require("rust-tools.executors").toggleterm,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          -- automatically set inlay hints (type hints)
          -- default: true
          auto = true,

          -- Only show inlay hints for the current line
          only_current_line = false,

          -- whether to show parameter hints with the inlay hints or not
          -- default: true
          show_parameter_hints = true,

          -- prefix for parameter hints
          -- default: "<-"
          parameter_hints_prefix = "<- ",

          -- prefix for all the other hints (type, chaining)
          -- default: "=>"
          other_hints_prefix = "=> ",

          -- whether to align to the length of the longest line in the file
          max_len_align = true,

          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,

          -- whether to align to the extreme right or not
          right_align = false,

          -- padding from the right if right_align is true
          right_align_padding = 7,

          -- The color of the hints
          highlight = "Comment",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {

          -- whether the hover action window gets automatically focused
          -- default: false
          auto_focus = true,
        },

      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
      server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        on_attach = function(_, bufnr)
          local rt = require('rust-tools')
          vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename', buffer = bufnr })
          vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { desc = 'Code Action', buffer = bufnr })

          vim.keymap.set('n', '<F12>', require('telescope.builtin').lsp_definitions,
            { desc = 'Goto Definition', buffer = bufnr })
          vim.keymap.set('n', '<S-F12>', require('telescope.builtin').lsp_references,
            { desc = 'Goto References', buffer = bufnr })
          vim.keymap.set('n', '<C-F12>', require('telescope.builtin').lsp_implementations,
            { desc = 'Goto Implementation', buffer = bufnr })
          vim.keymap.set('n', '<A-F12>', require('telescope.builtin').lsp_type_definitions,
            { desc = 'Type Definition', buffer = bufnr })
          vim.keymap.set('n', '<leader><F12>', require('telescope.builtin').lsp_document_symbols,
            { desc = 'Document Symbols', buffer = bufnr })
          vim.keymap.set('n', '<leader><S-F12>', require('telescope.builtin').lsp_dynamic_workspace_symbols,
            { desc = 'Workspace Symbols', buffer = bufnr })

          vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = 'Hover Documentation', buffer = bufnr })
          vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help,
            { desc = 'Signature Documentation', buffer = bufnr })
          vim.keymap.set('n', '<leader>l', vim.lsp.buf.declaration, { desc = 'Goto Declaration', buffer = bufnr })
          vim.keymap.set('n', '<leader>h', rt.hover_actions.hover_actions, { desc = 'Hover Actions', buffer = bufnr })
          vim.keymap.set('n', '<leader>a', rt.code_action_group.code_action_group,
            { desc = 'Hover Actions', buffer = bufnr })
          vim.keymap.set('n', '<F5>', require('rust-tools').debuggables.debuggables,
            { desc = 'Rust Debuggables', buffer = bufnr })
          vim.keymap.set('n', '<leader>L', vim.diagnostic.open_float, { desc = 'Open Diagnostic', buffer = bufnr })

          vim.diagnostic.config({
            virtual_text = false,
          })

          -- Auto format on save
          -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ filetypes = {'rust'} })]]
          vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
        end,
      }, -- rust-analyzer options

      -- debugging stuff
      -- dap = {
      --   adapter = require('rust-tools.dap').get_codelldb_adapter(
      --   codelldb_path, liblldb_path)
      -- }
    }
    if this_os:find "Windows" then
      opts.dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
          codelldb_path, liblldb_path)
      }
    end
    require('rust-tools').setup(opts)
  end
}
