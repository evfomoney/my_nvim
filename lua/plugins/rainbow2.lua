local status, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status then
	vim.notify("没有找到 rainbow")
	return
end

-- rainbow_delimiters.setup()
