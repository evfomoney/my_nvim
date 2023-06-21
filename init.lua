require("core.basic")
require("core.mapping")
require("core.colorscheme")
require("plugins.p-init")

-- plugins requirement
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.nvim-treesitter")
--require('plugins.glow')

-- mason.nvim
require("mlsp.m-init")
require("mlsp.cmp")
require("mlsp.lspconfig")
require("mlsp.null-ls")
require("mlsp.trouble")
require("mlsp.comment")

-- health.lua
require("health")
