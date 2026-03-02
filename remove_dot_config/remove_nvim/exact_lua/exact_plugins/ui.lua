return {
  {
    -- notification style popups
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          view = "messages",
          filter = {
            event = "msg_show",
            kind = {
              "shell_out",
              "shell_err",
              "shell_ret",
            },
          },
        },
      },
    },
  },
  {
    -- status line
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    -- space efficient alternative to winbar
    "b0o/incline.nvim",
    event = "VeryLazy",
    opts = {
      highlight = {
        groups = {
          InclineNormal = { default = true, group = "lualine_a_normal" },
          InclineNormalNC = { default = true, group = "lualine_b_normal" },
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
          wo = {
            winbar = "",
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
