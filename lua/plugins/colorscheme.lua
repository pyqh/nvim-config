return {
  {
    'catppuccin/nvim',
    enabled = false,
    name = 'catppuccin',
    priority = 1000,
    opts = {
      no_italic = true,
      color_overrides = {
        mocha = {
          base = '#151515',
          mantle = '#0e0e0e',
          crust = '#080808',
        },
      },
      integrations = { lsp_trouble = true },
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'vscode'
      vim.o.background = 'dark'
    end,
  },
  {
    'rockyzhang24/arctic.nvim',
    enabled = false,
    branch = 'v2',
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      vim.cmd [[colorscheme arctic]]
    end,
  },
  {
    'askfiy/visual_studio_code',
    enabled = false,
    priority = 100,
    config = function()
      vim.cmd [[colorscheme visual_studio_code]]
    end,
  },
}
