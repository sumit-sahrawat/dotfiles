return {
  {
    -- completions
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
      },
    },
  },
  {
    -- incremental rename with live preview
    "saecki/live-rename.nvim",
  },
  {
    -- smart indent detection
    "NMAC427/guess-indent.nvim",
    event = "BufReadPost",
    opts = {},
  },
  {
    -- auto-close unedited buffers
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    -- enable keybinds for live-rename iff LSP is active
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "<leader>cr",
              function()
                require("live-rename").rename()
              end,
              desc = "Rename (live-rename.nvim)",
              has = "rename",
            },
          },
        },
      },
    },
  },
  {
    -- better autopairs using tree-sitter
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = function()
      Snacks.toggle({
        name = "Auto Pairs",
        get = function()
          return not require("nvim-autopairs").state.disabled
        end,
        set = function(state)
          local m = require("nvim-autopairs")
          if state then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>up")
    end,
  },
  {
    -- disable this in favour of nvim-autopair
    "nvim-mini/mini.pairs",
    enabled = false,
  },
  {
    -- single vs multi-line code blocks using tree-sitter
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
