vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.cursorline = true

vim.wo.signcolumn = "yes"

vim.wo.colorcolumn = "80"

-- 修改 缩进等, 4缩进 or 2缩进 -- 目的是去契合formatter
-- 2 缩进 : 大多数
-- 4 缩进 : py
vim.o.shiftround = true
local filename = vim.fn.expand("%")
local extension = filename:match(".+%.(%w+)$")
if extension == "java" then
	vim.o.tabstop = 4
	vim.bo.tabstop = 4
	vim.o.softtabstop = 4
	vim.o.shiftwidth = 4
	vim.bo.shiftwidth = 4
else
	vim.o.tabstop = 2
	vim.bo.tabstop = 2
	vim.o.softtabstop = 2
	vim.o.shiftwidth = 2
	vim.bo.shiftwidth = 2
end

vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false

vim.o.incsearch = true

vim.o.cmdheight = 2

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = false

vim.o.whichwrap = "<,>,[,]"

vim.o.hidden = true

vim.o.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.updatetime = 300

vim.o.timeoutlen = 500

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- vim.o.background = "dark" -- is closed to colorscheme : so this item is put in colorscheme.lua
vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.o.list = true
vim.o.listchars = "space:·"

vim.o.wildmenu = true

vim.o.shortmess = vim.o.shortmess .. "c"

vim.o.pumheight = 10

vim.o.showtabline = 2

vim.o.showmode = false

vim.opt.iskeyword:append("-") -- consider string-string as whole word
