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
    -- tree-sitter based movement
    "aaronik/treewalker.nvim",
    cmd = "Treewalker",
    opts = {
      scope_confined = true,
    },
    keys = {
      {
        "<leader>Tk",
        "<cmd>Treewalker Up<cr>",
        desc = "Treewalker Up",
      },
      {
        "<leader>Tj",
        "<cmd>Treewalker Down<cr>",
        desc = "Treewalker Down",
      },
      {
        "<leader>Tl",
        "<cmd>Treewalker Right<cr>",
        desc = "Treewalker Right",
      },
      {
        "<leader>Th",
        "<cmd>Treewalker Left<cr>",
        desc = "Treewalker Left",
      },
      {
        "<leader>TK",
        "<cmd>Treewalker SwapUp<cr>",
        desc = "Treewalker SwapUp",
      },
      {
        "<leader>TJ",
        "<cmd>Treewalker SwapDown<cr>",
        desc = "Treewalker SwapDown",
      },
      {
        "<leader>TL",
        "<cmd>Treewalker SwapRight<cr>",
        desc = "Treewalker SwapRight",
      },
      {
        "<leader>TH",
        "<cmd>Treewalker SwapLeft<cr>",
        desc = "Treewalker SwapLeft",
      },
      {
        "<c-t>",
        function()
          require("which-key").show({
            keys = "<leader>T",
            loop = true,
          })
        end,
        desc = "Treewalker Hydra",
      },
    },
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
        "<c-=>",
        function()
          require("treesj").toggle()
        end,
        desc = "Toggle single/multi-line using tree-sitter",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
    },
  },
}
