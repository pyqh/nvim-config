
return {
  require 'extras.coding.copilot',
  {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind-nvim',
    },
    config = function()
      require 'extras.coding.cmp'
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    build = (not jit.os:find 'Windows')
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    opts = { history = true, delete_check_events = 'TextChanged' },
    keys = {
      {
        '<S-Tab>',
        function()
          require('luasnip').jump(-1)
        end,
        mode = { 'i', 's' },
      },
    },
  }, 
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  {
    'numToStr/Comment.nvim',
    opts = { -- ctrl+/
      toggler = { line = '<C-_>' },
      opleader = { line = '<C-_>' },
    },
    lazy = false,
  },
}