return {
  -- Mason (moved to lsp.lua)
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion (moved to cmp.lua)
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
    end
  },

  -- GitHub Copilot (moved to copilot.lua)
  { 'zbirenbaum/copilot.lua' },
  { 'zbirenbaum/copilot-cmp' },

  -- Integrated Terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup()
    end
  },

  -- Debugging
  { 'mfussenegger/nvim-dap' },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio', -- Add missing dependency
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      
      dapui.setup()
      
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end
  },

  -- UI Enhancements
  { 'stevearc/dressing.nvim' },

  -- Search and Replace
  { 'nvim-pack/nvim-spectre' },

  -- Colorscheme
  { 
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd[[colorscheme tokyonight]]
    end
  },
}
