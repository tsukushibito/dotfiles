return {
  "akinsho/toggleterm.nvim",
  cond = not vim.g.vscode,
  lazy = true,
  keys = {
    { '<C-\\>',     '<cmd>ToggleTerm<CR>',                              desc = 'Toggle terminal' },
    { '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<CR>', desc = 'Horizontal terminal' },
    { '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<CR>',   desc = 'Vertical terminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>',              desc = 'Floating terminal' },
    { '<leader>t1', '<cmd>ToggleTerm 1<CR>',                            desc = 'Toggle terminal 1' },
    { '<leader>t2', '<cmd>ToggleTerm 2<CR>',                            desc = 'Toggle terminal 2' },
    { '<leader>t3', '<cmd>ToggleTerm 3<CR>',                            desc = 'Toggle terminal 3' },
  },
  opts = {
    open_mapping = [[<C-\>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
    local key_opts = { noremap = true, silent = true }
    vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], key_opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], key_opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], key_opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], key_opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], key_opts)
  end,
}
