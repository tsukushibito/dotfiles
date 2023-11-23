return {
  'nvim-telescope/telescope-frecency.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  keys = {
    { '<leader>fr', '<Cmd>Telescope frecency<CR>', },
  },
  config = function()
    require('telescope').load_extension 'frecency'
    vim.keymap.set('n', '<leader>fr', '<Cmd>Telescope frecency<CR>', {})
  end,
}
