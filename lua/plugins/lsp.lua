if string.find(vim.fn.getcwd(), "/mnt")  then -- wsl
  return{}
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("extras.lsp")
    end,
  },
  { "VidocqH/lsp-lens.nvim", config = true },
}
