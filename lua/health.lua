-- 调节window10 剪切板
vim.cmd([[
augroup fix_yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
augroup END
]])

vim.cmd([[autocmd BufWritePre *.md :silent! execute ':silent! write !sleep 1s']])

-- provider-perl
--vim.cmd [[let g:perl_host_prog = '/path/to/perl']]
--vim.env.PERL5LIB = '/path/to/perl5.22/lib'
-- This is because the neovim need perl5.22 but the environment's perl is 5.30
vim.cmd([[let g:loaded_perl_provider = 0]])
