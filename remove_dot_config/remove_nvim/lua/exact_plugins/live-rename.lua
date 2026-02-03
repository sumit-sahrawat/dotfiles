return {
  {
    "saecki/live-rename.nvim",
  },
  {
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
}
