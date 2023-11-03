return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    opts = {
      formatters_by_ft = {
        c = { 'clang_format' },
        lua = { 'stylua' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        vue = { 'prettierd' },
        css = { 'prettier' },
        scss = { 'prettier' },
        less = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        python = { 'isort', 'black' },
        markdown = { 'prettierd', 'markdownlint' },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- async = false, -- not recommended to change
      -- quiet = false -- not recommended to change
    },
  },
}
