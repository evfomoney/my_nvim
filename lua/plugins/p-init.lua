local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- 每次保存后自动更新, 安装插件
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost p-init.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	vim.notify("没有找到 packer")
	return
end

packer.startup({
	function(use)
		use("wbthomason/packer.nvim")
		-- My plugins here
		-- colorschme
		use("folke/tokyonight.nvim")
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nvim-tree
		use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine.nvim
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope.nvim
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.1",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		-- nvim-treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		-- indent blankline
		use({ "lukas-reineke/indent-blankline.nvim" })

		-- autopairs.nvim
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- command.nvim
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- hop.nvim
		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})

		-- gitsigns.nvim
		use("lewis6991/gitsigns.nvim")

		-- rainbow-delimiters.nvim
		use("HiPhish/rainbow-delimiters.nvim")

		-- filetype.nvim : load file more quickly
		use("nathom/filetype.nvim")

		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("L3MON4D3/LuaSnip") -- snippets引擎，不装这个自动补全会出问题
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-path") -- 文件路径
		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")

		-- mason.nvim
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})
		use({
			"nvimdev/lspsaga.nvim",
			after = "nvim-lspconfig",
			config = function()
				require("lspsaga").setup({
					finder = {
						left_width = 0.2,
						right_width = 0.5,
					},
				})
			end,
		})

		-- trouble
		use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
		use("onsails/lspkind.nvim") -- UI增强, icons for autocompletion
		use("simrat39/rust-tools.nvim") -- rust server

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		max_jobs = 10,
		git = {
			default_url_format = "git@github.com:%s",
		},
	},
})
