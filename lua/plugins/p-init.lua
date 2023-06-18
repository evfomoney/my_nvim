local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
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


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- colorschme
  use 'folke/tokyonight.nvim'
  -- nvim-tree
  use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
  -- bufferline
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
  -- lualine.nvim
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use("arkav/lualine-lsp-progress")
  -- telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- mason.nvim
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  --补全部分
  -- 补全引擎
  use("hrsh7th/nvim-cmp")
  -- snippet 引擎
  use("hrsh7th/vim-vsnip")
  -- 补全源
  use("L3MON4D3/LuaSnip")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  -- 常见编程语言代码段
  use("rafamadriz/friendly-snippets")
  
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)
