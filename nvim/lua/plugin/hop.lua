return {
  'phaazon/hop.nvim',
  keys = {
    { '<leader>f', ':HopChar2MW<CR>' }
  },
  config = function()
    require('hop').setup()
  end
}
