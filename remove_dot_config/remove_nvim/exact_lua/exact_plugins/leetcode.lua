return {
  {
    "kawre/leetcode.nvim",
    build = "<cmd>TSUpdate html<CR>",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim",
    },
    opts = {
      arg = "leetcode.nvim",
    },
  },
}
