local is_windows = vim.loop.os_uname().version:match("Windows") ~= nil
if is_windows then
  -- スクロール速度が遅すぎるので使わない
  return {}
else
  return {
    "karb94/neoscroll.nvim",
    opts = {
      easing = "circular",
    },
    lazy = false,
    config = function(_, opts)
      require("neoscroll").setup(opts)
      local neoscroll = require('neoscroll')
      local keymap = {
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 100 }) end,
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 100 }) end,
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 150 }) end,
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 150 }) end,
        ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 50 }) end,
        ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 50 }) end,
        ["zt"]    = function() neoscroll.zt({ half_win_duration = 50 }) end,
        ["zz"]    = function() neoscroll.zz({ half_win_duration = 50 }) end,
        ["zb"]    = function() neoscroll.zb({ half_win_duration = 50 }) end,
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end
  }
end
