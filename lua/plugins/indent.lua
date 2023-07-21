vim.opt.termguicolors = true

if vim.o.background == "dark" then
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#352f20 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#241f15 gui=nocombine]])
else
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#f3da8d gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#d3ccb4 gui=nocombine]])
end

require("indent_blankline").setup({
	char = "",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	show_trailing_blankline_indent = false,
})
