require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig")["lua_ls"].setup {
  capabilities = capabilities,
}

--require("lspconfig")["pyright"].setup {
  --capabilities = capabilities,
--}
--
--
--require("lspconfig")["cssls"].setup {
  --capabilities = capabilities,
--}
--
--require("lspconfig")["html"].setup {
  --capabilities = capabilities,
--}
--
--require("lspconfig")["jsonls"].setup {
  --capabilities = capabilities,
--}
--
--require("lspconfig")["tsserver"].setup {
  --capabilities = capabilities,
--}
--
--require("lspconfig")["bashls"].setup {
  --capabilities = capabilities,
--}
