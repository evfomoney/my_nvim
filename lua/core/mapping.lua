vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

map("n", "s", "", opt)
map("n", "R", ":wa<cr>:edit<cr>", opt) -- 保存并刷新 当前文件
map("i", ",a", "<Esc>", opt)

-- when use x, it means delete without copy to register
map("n", "x", '"_x', opt)

map("n", "sv", ":vsp<cr>", opt)
map("n", "sh", ":sp<cr>", opt)

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-k>", "<C-w>k", opt)

map("n", "<C-Left>", ":vertical resize +2<cr>", opt)
map("n", "<C-Right>", ":vertical resize -2<cr>", opt)
map("n", "<C-Down>", ":resize +10<cr>", opt)
map("n", "<C-Up>", ":resize -10<cr>", opt)

map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map("v", "J", ":move '>+1<cr>gv-gv", opt)
map("v", "K", ":move '<-2<cr>gv-gv", opt)

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>bp", ":BufferLinePick<CR>", opt)
-- 关闭, 所用的为格外的"删除插件" :"moll/vim-bbye"
map("n", "<C-d>", ":Bdelete!<CR>", opt)

-- Telescope_mappings
-- 查找文件
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>fs", ":Telescope live_grep<CR>", opt)
-- 列出git文件
map("n", "<leader>fg", ":Telescope git_files<cr>", opt)
-- 列出帮助文档
map("n", "<leader>fh", ":Telescope man_pages<cr>", opt)

-- nvim-tree
map("n", "<leader>tf", ":NvimTreeFocus<cr>", opt)
map("n", "<leader>tt", ":NvimTreeToggle<cr>", opt)
map("n", "<leader>tr", ":NvimTreeRefresh<cr>", opt)

-- hop.nvim_mappings
map("n", "<leader>hw", ":HopWordMW<cr>", opt)

-- trouble.nvim
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opt)
map("n", "<leader>xd", "<cmd>TroubleToggle workspace_diagnostics<cr>", opt)
