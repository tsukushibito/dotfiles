return {
  "akinsho/bufferline.nvim",
  dependensies = {
    { "nvim-tree/nvim-web-devicons", lazy = true, },
  },
  cond = not vim.g.vscode,
  lazy = false,
  opts = {
    -- bufferline.nvimの設定オプションをここに記述できます
    options = {
      -- 例: バッファ番号を表示する
      numbers = "ordinal",
      -- その他のオプション
    },
  },
  keys = {
    -- バッファ間の移動
    { "<S-l>",      "<cmd>BufferLineCycleNext<CR>",    desc = "Move to next buffer" },
    { "<S-h>",      "<cmd>BufferLineCyclePrev<CR>",    desc = "Move to previous buffer" },

    -- 特定のバッファに直接移動
    { "<leader>1",  "<cmd>BufferLineGoToBuffer 1<CR>", desc = "which_key_ignore" },
    { "<leader>2",  "<cmd>BufferLineGoToBuffer 2<CR>", desc = "which_key_ignore" },
    { "<leader>3",  "<cmd>BufferLineGoToBuffer 3<CR>", desc = "which_key_ignore" },
    { "<leader>4",  "<cmd>BufferLineGoToBuffer 4<CR>", desc = "which_key_ignore" },
    { "<leader>5",  "<cmd>BufferLineGoToBuffer 5<CR>", desc = "which_key_ignore" },
    { "<leader>6",  "<cmd>BufferLineGoToBuffer 6<CR>", desc = "which_key_ignore" },
    { "<leader>7",  "<cmd>BufferLineGoToBuffer 7<CR>", desc = "which_key_ignore" },
    { "<leader>8",  "<cmd>BufferLineGoToBuffer 8<CR>", desc = "which_key_ignore" },
    { "<leader>9",  "<cmd>BufferLineGoToBuffer 9<CR>", desc = "which_key_ignore" },
    -- 必要に応じて追加

    -- バッファの並べ替え
    { "<leader>>",  "<cmd>BufferLineMoveNext<CR>",     desc = "Move buffer right" },
    { "<leader><",  "<cmd>BufferLineMovePrev<CR>",     desc = "Move buffer left" },

    -- バッファの閉鎖
    { "<leader>c",  "<cmd>bdelete<CR>",                desc = "Close current buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>",  desc = "Close other buffers" },
    { "<leader>bp", "<cmd>BufferLinePickClose<CR>",    desc = "Pick buffer to close" },

    -- バッファのピン留め
    { "<leader>p",  "<cmd>BufferLineTogglePin<CR>",    desc = "Toggle pin" },

    -- バッファのピック
    { "<leader>bb", "<cmd>BufferLinePick<CR>",         desc = "Pick buffer" },
  },
}
