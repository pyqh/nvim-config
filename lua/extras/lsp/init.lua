-- https://www.bilibili.com/video/BV1AN4y1Z7wb/
local servers = require("extras.lsp.list").servers
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local default_config = require("extras.lsp.default_config")

local servers_handlers = {}
-- 合并默认配置和自定义配置
for _, value in pairs(servers) do
    local status, config = pcall(require, "extras.lsp.server_config." .. value)
    if not status then config = {} end
    servers_handlers[value] = function()
        lspconfig[value].setup(vim.tbl_deep_extend("force", default_config(),
                                                   config))
    end
end

mason_lspconfig.setup({ensure_installed = list, handlers = servers_handlers})
