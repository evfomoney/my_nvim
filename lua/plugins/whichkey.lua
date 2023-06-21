local status, wk = pcall(require, "whichkey")
if not status then
	vim.notify("没有找到 whichkey")
	return
end

wk.setup({
	plugins = {
		speling = {
			enabled = true,
			suggestion = 20,
		},
	},
})
