-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

--  to disable file types use
-- "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
local sources = {
	null_ls.builtins.formatting.google_java_format, -- java formatter
	null_ls.builtins.formatting.black, -- python formatter
	null_ls.builtins.formatting.stylua, -- lua formatter
	-- js/ts formatter
	null_ls.builtins.formatting.prettier.with({
		disabled_filetypes = { "html" },
	}),
	null_ls.builtins.diagnostics.eslint_d.with({ -- js/ts linter
		-- only enable eslint if root has .eslintrc.js
		condition = function(utils)
			return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
		end,
	}),
	null_ls.builtins.code_actions.gitsigns,
}

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = sources,
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
