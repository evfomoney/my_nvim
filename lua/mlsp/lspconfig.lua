-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

-- import rust-tools plugin safely
local rust_setup, rt = pcall(require, "rust-tools")
if not rust_setup then
	return
end

local map = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- mappings
	map.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- goto declaration
	-- '<C-c>v' for vsplit
	map.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	--  o for open; s for vsplit; [w for shuttle
	map.set("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", opts)
	map.set("n", "<leader>gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- show 当前buf中所有该关键字的运用处, 其功能完全可以由Lspaga finder 替代
	map.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	map.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	map.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation

	map.set("n", "<leader>m", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	map.set("n", "<leader>M", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	-- "<C-f> / <C-b>" for scroll_preview
	map.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	map.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

	map.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	map.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
	map.set("n", "<leader>k", "<cmd>Lspsaga term_toggle<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		map.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		map.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		map.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure rust server with plugin
rt.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure cpp clangd
-- lspconfig["clangd"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- configure emmet  server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure java server
lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.fn.getcwd()
	end,
})

-- configure pyright server
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		pyright = {
			autoImportCompletion = true,
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	root_dir = function()
		return vim.fn.getcwd()
	end,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
