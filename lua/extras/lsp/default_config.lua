local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_attach = function(client, bufnr)
  -- vim.lsp.inlay_hint.enable(bufnr, true)

  local opts = { buffer = 0, noremap = true, silent = true }
  local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, opts)
  end
  
  map("n", "fh", vim.lsp.buf.hover, opts)
  map("n", "fg", vim.lsp.buf.definition, opts)
  map("n", "fr", vim.lsp.buf.references, opts)
  map("n", "rn", vim.lsp.buf.rename,opts)
end

return {
  capabilities = lsp_capabilities,
  on_attach = lsp_attach
}
