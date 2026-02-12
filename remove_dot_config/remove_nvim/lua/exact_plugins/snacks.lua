return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          explorer = { hidden = true },
        },
      },
      indent = {
        enabled = false,
      },
      lazygit = {
        configure = false,
      },
      terminal = {
        win = {
          keys = {
            nav_h = false,
            nav_j = false,
            nav_k = false,
            nav_l = false,
          },
        },
      },
    },
    keys = {
      {
        "<leader>sP",
        function()
          Snacks.picker.pickers()
        end,
        desc = "Snacks Pickers",
      },
    },
  },
}
