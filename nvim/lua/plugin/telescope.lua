return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', '<Cmd>Telescope find_files<CR>' },
    { '<leader>fg', '<Cmd>Telescope live_grep<CR>' },
    { '<leader>fb', '<Cmd>Telescope buffers<CR>' },
    { '<leader>fh', '<Cmd>Telescope help_tags<CR>' },
  },
  config = function()
    require('telescope').setup()
  end
}
