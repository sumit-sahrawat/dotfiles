return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "mmdc",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        width = "full",
        border = "thick",
      },
      anti_conceal = {
        ignore = {
          code_background = false, -- make cursorline work in code blocks
        },
      },
    },
  },
}
