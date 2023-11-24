return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>', 'NvimTreeToggle' }
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        float = { 
          enable = true,
        },
      },
    })
  end
}
