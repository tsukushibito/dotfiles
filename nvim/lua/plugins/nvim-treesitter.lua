return {
  {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    build = ":TSUpdate", -- インストール後に自動でパーサを更新
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- 使用する機能のリスト
        highlight = {
          enable = true,                             -- シンタックスハイライトを有効にする
          additional_vim_regex_highlighting = false, -- Neovimのデフォルトのハイライトと競合しないようにする
        },
        indent = {
          enable = true, -- インデントを有効にする
        },
        incremental_selection = {
          enable = true,               -- 増分選択を有効にする
          keymaps = {
            init_selection = "gnn",    -- 初期選択
            node_incremental = "grn",  -- ノードを増やす
            scope_incremental = "grc", -- スコープを増やす
            node_decremental = "grm",  -- ノードを減らす
          },
        },
        textobjects = {
          select = {
            enable = true,                -- テキストオブジェクトの選択を有効にする
            lookahead = true,             -- 次の候補を自動でハイライト
            keymaps = {
              ["af"] = "@function.outer", -- 関数全体を選択
              ["if"] = "@function.inner", -- 関数内部を選択
              ["ac"] = "@class.outer",    -- クラス全体を選択
              ["ic"] = "@class.inner",    -- クラス内部を選択
            },
          },
          move = {
            enable = true,                -- テキストオブジェクトの移動を有効にする
            set_jumps = true,             -- ジャンプリストに記録
            goto_next_start = {
              ["]m"] = "@function.outer", -- 次の関数の先頭に移動
              ["]c"] = "@class.outer",    -- 次のクラスの先頭に移動
            },
            goto_previous_start = {
              ["[m"] = "@function.outer", -- 前の関数の先頭に移動
              ["[c"] = "@class.outer",    -- 前のクラスの先頭に移動
            },
          },
        },
        -- 自動インストールする言語のリスト
        ensure_installed = {
          "lua", "python", "javascript", "typescript", "html", "css", "json", "markdown", "bash", "rust",
        },
        auto_install = true, -- ファイルを開いたときに必要なパーサを自動インストール
      })
    end,
  },
}
