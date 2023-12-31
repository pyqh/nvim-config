return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("extras.cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = { history = true, delete_check_events = "TextChanged" },
    keys = {
      {
        "<S-Tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  {
    "numToStr/Comment.nvim",
    opts = { -- ctrl+/
      toggler = { line = "<C-_>" },
      opleader = { line = "<C-_>" },
    },
  },
}
