-- See: https://neovim.io/doc/user/intro.html#key-notation

vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<Space>", "<NOP>")
map("n", "p", "<NOP>")

-- msvim
map("v", "<BS>", '"_d')
map("v", "<C-x>", '"+x')
map("v", "<C-c>", '"+y')
-- map("v", "<C-v>", '"+gP')
-- Save
map("n", "<C-s>", "<cmd>w<CR>")
map("i", "<C-s>", "<cmd>w<CR>")
-- undo
map("n", "<C-z>", "u")
map("i", "<C-z>", "<C-o>u")
-- Redo
map("n", "<C-y>", "<C-r>")
map("i", "<C-y>", "<C-o><C-r>")
-- close window
map("n", "<C-w>", "<cmd>bd!<CR>")
map("i", "<C-w>", "<cmd>bd!<CR>")

------
-- 窗口
map("n", "<C-\\>", "<C-w>v") -- 水平新增窗口
map("n", "<C-k><C-\\>", "<cmd>close<CR>")

-- 快速缩进和取消缩进
map("n", "<TAB>", ">>")
map("n", "<S-TAB>", "<<")

-- increment/decrement
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

--  quit and reload
-- map("n", "<leader>s", "<cmd>so %<CR>")
map("n", "<C-q>", "<cmd>q!<CR>")
map("i", "<C-q>", "<NOP>")

-- escape
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
-- move
map("i", "<C-o>", "<End><CR>")

map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

map("i", "<A-n>", "<C-Left>")
map("i", "<A-m>", "<C-Right>")

map("i", "<C-u>", "<Home>")
map("i", "<C-i>", "<End>")
-- scroll half page
map("n", ",", "<C-u>")
map("n", ".", "<C-d>")

-- 单行或多行移动
-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- 切换buffer
map("n", "<S-j>", "<cmd>bnext<CR>")
map("n", "<S-k>", "<cmd>bprevious<CR>")

-- 取消高亮
map("n", "<ESC>", "<cmd>nohl<CR>")

-- terminal
map("n", "<C-t>", "<cmd>tab terminal<CR>")
map("t", "<ESC>", "<C-\\><C-n>")
