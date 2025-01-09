return { 
  "danymat/neogen", 
  opts = {
    enabled = true,
  },
  keys = {
      { 
      "<leader>cd",
      function() 
        require("neogen").generate()
      end,
      desc = "Generate documentation with Neogen" },
  }
}
