local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

local choice = function()
	if vim.o.background == "light" then
		return "iceberg_light" -- iceberg_light, solarized_light
	else
		return "codedark"
	end
end

lualine.setup({
	options = {
		theme = choice(),
		component_separators = { left = "|", right = "|" },
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			{ "filename", path = 1 }, -- relative path
		},
		lualine_x = {
			"filesize",
			"encoding",
		},
	},
})
