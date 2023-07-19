local colorscheme = "gruvbox" -- or "tokyonight"
local status_ok, tn = pcall(require, colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
	return
end

vim.o.background = "dark" -- or "light" or "dark"

tn.setup({
	-- style = "storm", -- used for tokyonight
	contrast = "soft", -- used for gruvbox : hard , soft or empty string

	dim_inactive = true,
	lualine_bold = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
	},
})

vim.cmd("colorscheme " .. colorscheme)
