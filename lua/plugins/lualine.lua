local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

lualine.setup({
	options = {
		theme = "codedark", -- codedark, ayu
		component_separators = { left = "|", right = "|" },
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			"filename",
		},
		lualine_x = {
			"filesize",
			"encoding",
		},
	},
})
