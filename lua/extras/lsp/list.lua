-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
return {
    lsp = {
        "cssls", "dockerls", "eslint", "jsonls", "pyright", "lua_ls", "clangd",
        "html", "tailwindcss", "volar", "marksman", "vtsls", "unocss",
        "emmet_ls"
    },
    ensure_installed = {
        "clang-format", -- c
        "prettierd",
        -- prettier for jsx, angular, flow, vue, typescript, css, less, scss, html, json, markdown, yaml
        "stylua", -- lua
        "black", -- *python
        "isort", -- python
        "markdownlint", -- markdown
        "efm"
        -- general language server
    }
}
