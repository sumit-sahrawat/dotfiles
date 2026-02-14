return {
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        symbols = {
          win = { position = "top" },
        },
        lsp = {
          win = { position = "top" },
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        -- vim regex to support both "TOOD:" and "TODO(...):"
        pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
      },
      search = {
        -- ripgrep regex to support both "TOOD:" and "TODO(...):"
        pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
      },
    },
  },
  {
    -- sub-word motions for camel/pascal cased words
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "w",
        function()
          require("spider").motion("w")
        end,
        mode = { "n", "o", "x" },
      },
      {
        "e",
        function()
          require("spider").motion("e")
        end,
        mode = { "n", "o", "x" },
      },
      {
        "b",
        function()
          require("spider").motion("b")
        end,
        mode = { "n", "o", "x" },
      },
      {
        "ge",
        function()
          require("spider").motion("ge")
        end,
        mode = { "n", "o", "x" },
      },
    },
  },
}
