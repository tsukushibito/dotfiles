return {
  { -- debug
    "mfussenegger/nvim-dap",
    cond = not vim.g.vscode,
    -- lazy = true,
    config = function()
      local dap = require("dap")

      vim.keymap.set("n", "<leader>ds", function() dap.continue() end, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dn", function() dap.step_over() end, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dmu", function() dap.up() end, { desc = "Move up in the stack trace" })
      vim.keymap.set("n", "<leader>dmd", function() dap.down() end, { desc = "Move down in the stack trace" })
      vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate debug session" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    cond = not vim.g.vscode,
    -- lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({
        element_mappings = {
          stacks = {
            open = "<CR>",
            expand = "o",
          }
        },
      })
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end

      vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
      local args = { enter = true, }
      vim.keymap.set('n', '<leader>de', function()
        require('dapui').eval(nil, args)
      end, { noremap = true, silent = true, desc = "Evaluate variable at cursor" })

      -- Variables (scopes) window in a floating window
      vim.keymap.set("n", "<leader>dfv", function()
        dapui.float_element("scopes", args)
      end, { noremap = true, silent = true, desc = "Show variables (scopes) in floating window" })

      -- Watches window in a floating window
      vim.keymap.set("n", "<leader>dfw", function()
        dapui.float_element("watches", args)
      end, { noremap = true, silent = true, desc = "Show watches in floating window" })

      -- Breakpoints window in a floating window
      vim.keymap.set("n", "<leader>dfb", function()
        dapui.float_element("breakpoints", args)
      end, { noremap = true, silent = true, desc = "Show breakpoints in floating window" })

      -- Stack trace window in a floating window
      vim.keymap.set("n", "<leader>dfs", function()
        dapui.float_element("stacks", args)
      end, { noremap = true, silent = true, desc = "Show stack trace in floating window" })

      -- REPL (console) in a floating window
      vim.keymap.set("n", "<leader>dfr", function()
        dapui.float_element("repl", args)
      end, { noremap = true, silent = true, desc = "Show REPL in floating window" })
    end,
  },
}
