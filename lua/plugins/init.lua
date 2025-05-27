return {
  -- LSP Configuration
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },

  -- File Explorer
  { 'nvim-tree/nvim-tree.lua' },

  -- Fuzzy Finder
  { 'nvim-telescope/telescope.nvim', tag = '0.1.0' },
  { 'nvim-lua/plenary.nvim' },

  -- GitHub Copilot
  { 'zbirenbaum/copilot.lua' },
  { 'zbirenbaum/copilot-cmp' },

  -- Integrated Terminal
  { 'akinsho/toggleterm.nvim', version = '*' },

  -- Debugging
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },

  -- Search and Replace
  { 'nvim-pack/nvim-spectre' },

  -- Colorscheme
  { 'folke/tokyonight.nvim' },
}
