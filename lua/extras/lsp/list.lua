-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
return {
  servers = {
    "clangd",
    "cssls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "tailwindcss",
    "volar",
    "vtsls",
  },
  ensure_installed = {
    -- "lua-language-server",
    "clang-format", -- c
    "prettierd",
    -- prettier for jsx, angular, flow, vue, typescript, css, less, scss, html, json, markdown, yaml
    "stylua", -- lua
    "black", -- *python
    "isort", -- python
    "markdownlint", -- markdown
    "efm",
    -- general language server
  },
}
