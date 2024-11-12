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
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
      vim.keymap.set("n", "<leader>df", function()
        dapui.float_element(nil, { enter = true, })
      end, { desc = "Show DAP UI element in Floating Window" })
    end,
  },
}
