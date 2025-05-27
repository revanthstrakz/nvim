local lspconfig = require('lspconfig')

-- Enable language servers
local servers = { 'pyright', 'gopls', 'tsserver', 'dartls' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }
end
