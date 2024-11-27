return {
  {
    "smoka7/hop.nvim",
    lazy = true,
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    keys = {
      { "<leader>hw", ":HopWord<CR>",    desc = "Hop to Word" },
      { "<leader>hc", ":HopChar1<CR>",   desc = "Hop to Char1" },
      { "<leader>hC", ":HopChar2<CR>",   desc = "Hop to Char2" },
      { "<leader>hl", ":HopLine<CR>",    desc = "Hop to Line" },
      { "<leader>hp", ":HopPattern<CR>", desc = "Hop to Pattern" },
    },
  },
}
