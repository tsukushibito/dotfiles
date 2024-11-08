return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    cond = not vim.g.vscode,
    lazy = false,
    keys = {
      {
        "<leader>,",
        function()
          local config_path = vim.fn.stdpath("config")
          vim.cmd("NvimTreeOpen " .. config_path)
        end,
        desc = "Open NvimTree at config directory",
        noremap = true,
        silent = true,
      },
      {
        "<leader>e",
        function()
          local current_dir = vim.fn.getcwd()
          vim.cmd("NvimTreeOpen " .. current_dir)
        end,
        desc = "Open NvimTree at current directory",
        noremap = true,
        silent = true,
      },
      {
        "<leader>E",
        function()
          local file_path = vim.api.nvim_buf_get_name(0)
          local dir_path = vim.fn.fnamemodify(file_path, ":h")
          if dir_path and dir_path ~= "" then
            vim.cmd("NvimTreeOpen " .. dir_path)
          else
            vim.notify("No file associated with the current buffer", vim.log.levels.WARN)
          end
        end,
        desc = "Open NvimTree at current buffer's directory",
        noremap = true,
        silent = true,
      },
      { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    config = function()
      require('nvim-tree').setup({
      })

      --[[
      local function open_nvim_tree(data)
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory then
          return
        end

        -- vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
      ]]
    end
  }
}
