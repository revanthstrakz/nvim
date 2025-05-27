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

  -- Touch-friendly UI enhancements
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        top_down = true,
        timeout = 3000,
        max_width = 80,
        render = 'wrapped-compact',
        stages = 'fade',
      })
      vim.notify = require('notify')
    end
  },
  
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup({
        cmdline = {
          view = 'cmdline_popup',
          size = 30,
        },
        popupmenu = {
          enabled = true,
        },
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              throttle = 50,
            },
          },
          hover = {
            enabled = true,
            silent = false,
            size = { max_height = 20, max_width = 80 },
          },
        },
      })
    end
  },
  
  -- Enhanced file browser with touch-friendly UI
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        window = {
          width = 30,
          mappings = {
            ['<space>'] = 'none',
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
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
          border = 'single',
          padding = { 2, 2, 2, 2 }, -- Increase padding for touch targets
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 80 },
          spacing = 4, -- Increase spacing for touch targets
        },
      })
      
      -- Register whichkey mappings for common operations
      local wk = require('which-key')
      wk.register({
        f = { 
          name = 'File',
          f = { '<cmd>Telescope find_files<CR>', 'Find File' },
          r = { '<cmd>Telescope oldfiles<CR>', 'Recent Files' },
          n = { '<cmd>enew<CR>', 'New File' },
        },
        e = { '<cmd>Neotree toggle<CR>', 'Explorer' },
        b = {
          name = 'Buffer',
          n = { '<cmd>bnext<CR>', 'Next Buffer' },
          p = { '<cmd>bprevious<CR>', 'Previous Buffer' },
          d = { '<cmd>bdelete<CR>', 'Delete Buffer' },
        },
      }, { prefix = '<leader>' })
    end
  },
  
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
