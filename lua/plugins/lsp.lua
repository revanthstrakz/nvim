return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      
      -- Setup Mason to automatically install LSP servers
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'pyright', 'gopls', 'ts_ls' , 'html', 'cssls', 'lua_ls' },
        automatic_installation = true,
      })

      -- Enable language servers
      -- Note: tsserver is deprecated but still works. The new name is typescript-language-server
      -- but keep using 'tsserver' as the config name for now
      local servers = { 'pyright', 'gopls', 'ts_ls', 'html', 'cssls', 'lua_ls' }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
      end
    end
  }
}
