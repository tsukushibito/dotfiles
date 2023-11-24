return {
  'phaazon/hop.nvim',
  keys = {
    { '<leader>/', '<Cmd>HopChar2MW<CR>' }
  },
  config = function()
    require('hop').setup()
  end
}
