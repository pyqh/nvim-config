local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- for ufo 折叠插件
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local function default_confit_builder()
  -- local init_config = true
  local opt = {
    inlay_hints = { enabled = true },
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    --- @param client lsp.Client
    ---@param bufnr integer
    -- lsp挂载时执行的回调函数
    on_attach = function(client, bufnr)
      -- Disable the formatting function and leave it to a special plug-in plug-in for processing
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- Bind shortcut keys
      -- require("extras.lsp.keymaps").map(bufnr)
    end,
  }

  return opt
end

return default_confit_builder
-- 预配置
