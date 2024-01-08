return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').create_default_mappings()
    end,
  },
}
