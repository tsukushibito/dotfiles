return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',

    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
      },
    },

    'folke/which-key.nvim',
  },
  event = 'VeryLazy',
  config = function ()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<F2>', vim.lsp.buf.rename, 'Rename')
      nmap('<F3>', vim.lsp.buf.code_action, 'Code Action')

      nmap('<F12>', require('telescope.builtin').lsp_definitions, 'Goto Definition')
      nmap('<S-F12>', require('telescope.builtin').lsp_references, 'Goto References')
      nmap('<C-F12>', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
      nmap('<A-F12>', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
      nmap('<leader><F12>', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
      nmap('<leader><S-F12>', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

      -- See `:help K` for why this keymap
      nmap('<leader>lK', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<leader>lk', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('<leader>l<F12>', vim.lsp.buf.declaration, 'Goto Declaration')
      -- nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
      -- nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
      -- nmap('<leader>lwl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, 'Workspace List Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      -- Auto format on save
      vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
    end

    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }

    -- [[ Configure nvim-cmp ]]
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }

  end
}
