return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        enabled = vim.fn.executable 'make' == 1,
        config = function()
            require('telescope').load_extension 'fzf'
        end,
      },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          prompt_prefix = '   ',
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
          mappings = {
            i = {
              ['<Esc>'] = require('telescope.actions').close,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
              ['<C-f>'] = require('telescope.actions').preview_scrolling_down,
              ['<C-b>'] = require('telescope.actions').preview_scrolling_up,
            },
          },
        },
      }
    end,
    keys = {
      { '<C-p>', '<cmd>Telescope find_files<cr>' },
      { '<leader>p', '<cmd>Telescope git_files<cr>' },
      { '<leader>f', '<cmd>Telescope live_grep<cr>' },
    },
  },
  {
    'RRethy/vim-illuminate', -- highlighting other uses of the word under the cursor
    lazy = false,
    keys = {
      {
        '<c-n>',
        function()
          require('illuminate').goto_next_reference(false)
        end,
      },
      {
        '<c-p>',
        function()
          require('illuminate').goto_prev_reference(false)
        end,
      },
      -- { '[[', false },
      -- { ']]', false },
    },
    opts = {
      filetypes_denylist = { 'dirbuf', 'dirvish', 'fugitive', 'tailscale' },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
    end,
  },
  { 'folke/trouble.nvim', opts = { cycle_results = false } },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = { { '<leader>e', '<cmd>NvimTreeToggle<cr>' } },
    config = true,
  },
  {
    'simrat39/symbols-outline.nvim',
    keys = { { '<leader>ol', '<cmd>SymbolsOutline<cr>' } },
    config = true,
  },
}
