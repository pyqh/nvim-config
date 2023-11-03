-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keys notation table: https://neovim.io/doc/user/intro.html#key-notation
vim.g.mapleader = ' '
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>', '<NOP>')
-- -----------------------most editor or syetem command----------------
-- select all
map('n', '<C-a>', 'gg<S-v>G')

-- undo
map('i', '<C-z>', '<C-o>u')
map('v', '<C-z>', '<ESC>u')
-- redo
map({ '', 'i' }, '<C-y>', '<c-o><c-r>')

-- save
map({ '', 'i' }, '<C-s>', vim.cmd.write)

-- colse window
map({ '', 'i' }, '<C-w>', '<ESC>:bd<CR>', opts)

-- -------------------vscode/sublime text editor------------------
-- 窗口
map('n', '<C-\\>', '<C-w>v') -- 水平新增窗口
map('n', '<C-k><C-\\>', ':close<CR>')

-- 快速缩进和取消缩进
map('n', '<TAB>', '>>', opts)
map('n', '<S-TAB>', '<<', opts)

-- 可视模式下缩进和减少缩进
map('v', '<TAB>', '<S->>gv', opts)
map('v', '<S-TAB>', '<S-<>gv', opts)

-- --------------------------custom------------------------------
-- --------- 正常模式 ---------- ---
-- increment/decrement
map('n', '=', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

--  quit and reload
map('n', '<leader>s', ':so %<CR>')
map('n', '<C-q>', '<cmd>q!<CR>', opts)

-- move
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')
map('i', '<C-o>', '<End><CR>')

-- move
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

map('i', '<C-n>', '<C-Left>')
map('i', '<C-m>', '<C-Right>')

map('i', '<C-u>', '<Home>')
map('i', '<C-i>', '<End>')

map('n', ',', '<C-u>') --half screen
map('n', '.', '<C-d>')

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', '<BS>', '"_d')-- delete without copy
-- ---------- 正常模式 ---------- ---

-- 切换buffer
map('n', '<leader>l', '<cmd>bnext<CR>', opts)
map('n', '<leader>h', '<cmd>bprevious<CR>', opts)

-- 取消高亮
map('n', '<ESC>', '<cmd>nohl<CR>', opts)
