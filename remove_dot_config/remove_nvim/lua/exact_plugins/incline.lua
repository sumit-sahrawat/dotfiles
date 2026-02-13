return {
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    opts = {
      hide = { cursorline = true },
      highlight = {
        groups = {
          InclineNormal = { default = true, group = "lualine_a_normal" },
          InclineNormalNC = { default = true, group = "Comment" },
        },
      },
      window = {
        margin = {
          vertical = 0,
          horizontal = 1,
        },
      },
    },
    keys = {
      {
        "<leader>uW",
        function()
          require("incline").toggle()
        end,
        desc = "Toggle Incline",
      },
    },
  },
}
