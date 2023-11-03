return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      theme = 'vscode',
      options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        -- 使用 nvim 内置lsp
        diagnostics = 'nvim_lsp',
        themable = true, -- Must
        separator_style = 'slant',
      },
    },
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'echasnovski/mini.indentscope',
    version = false,
    opts = {
      -- symbol = "▏",
      symbol = '│',
      options = { try_as_border = true },
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- "rcarriga/nvim-notify"
    },
  },
}
