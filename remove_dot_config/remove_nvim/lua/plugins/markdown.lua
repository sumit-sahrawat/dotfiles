return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        markdown_oxide = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
        },
      },
    },
  },
}
