return {
  {
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
    "nvim-mini/mini.pairs",
    enabled = false,
  },
}
