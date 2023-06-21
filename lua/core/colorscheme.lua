local colorscheme = "tokyonight"
local status_ok, tn = pcall(require, colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
	return
end

tn.setup({
	style = "storm",
	dim_inactive = true,
	lualine_bold = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
	},
})

vim.cmd("colorscheme " .. colorscheme) -- default is tokyonight-storm
