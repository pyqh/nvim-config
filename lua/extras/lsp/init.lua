-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local list = require("extras.lsp.list")
local default_config = require("extras.lsp.default_config")

local servers_handlers = {}
-- 合并默认配置和自定义配置
for _, value in pairs(list.ls) do
  local status, config = pcall(require, "extras.lsp.server_config." .. value)
  if not status then
    config = {}
  end
  servers_handlers[value] = function()
    require("lspconfig")[value].setup(
      vim.tbl_deep_extend("force", default_config, config)
    )
  end
end
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = list.ls,
  handlers = servers_handlers,
})

-- Install third party package
local mr = require("mason-registry")
local function ensure_installed()
	for _, tool in ipairs(list.other) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end
if mr.refresh then
	mr.refresh(ensure_installed)
else
	ensure_installed()
end