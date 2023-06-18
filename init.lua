require('core.basic')
require('core.mapping')
require('core.colorscheme')
require('plugins.p-init')

-- plugins requirement
require('plugins.nvim-tree')
require('plugins.bufferline')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.nvim-treesitter')

-- mason.nvim
require('mlsp.m-init')
require('mlsp.cmp')



-- 调节window10 剪切板
vim.cmd([[
augroup fix_yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
augroup END
]])
