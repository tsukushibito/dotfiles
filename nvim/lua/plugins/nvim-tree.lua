return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { 
    "nvim-tree/nvim-tree.lua", 
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "" },
      { "<leader>f", "<cmd>NvimTreeFindFile<cr>", desc = "" },
    },
    opts = {},
  }
}
