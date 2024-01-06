vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opt = vim.opt
-- opt.shell = "powershell"

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 折叠
opt.wrap = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse = "a"

-- 系统剪贴板
-- opt.clipboard = "unnamedplus"
-- opt.clipboard:append("unnamedplus")
opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- opt.spell = true
-- opt.spelllang = "en_us"
