return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 150,
    },
    keys = {
      {
        "<C-=>",
        function()
          require("treesj").toggle()
        end,
        desc = "Toggle single/multi-line using tree-sitter",
      },
    },
  },
}
