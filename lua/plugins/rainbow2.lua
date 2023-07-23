local status, rainbow = pcall(require, "nvim-treesitter.config")
if not status then
	vim.notify("没有找到 rainbow")
	return
end

rainbow.setup({
	rainbow = {
		enable = true,
		-- list of languages you want to disable the plugin for
		disable = { "jsx", "cpp" },
		-- Which query to use for finding delimiters
		query = "rainbow-parens",
		-- Highlight the entire buffer all at once
		strategy = require("ts-rainbow").strategy.global,
	},
})

vim.builtin.treesitter.rainbow.enable = true
