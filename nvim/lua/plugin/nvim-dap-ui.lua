return {
  'rcarriga/nvim-dap-ui',
  keys = {
    {'<leader>dt', ':lua require("dapui").toggle()<CR>', },
    {'<leader>de', ':lua require("dapui").eval()<CR>', },
  },
  config =function ()
    require("dapui").setup({
    })
  end
}
