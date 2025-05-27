return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        win = {
          border = 'single',
          padding = { 2, 2, 2, 2 },
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 80 },
          spacing = 4,
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        disable = {
          buftypes = {},
          filetypes = { "TelescopePrompt" },
        },
      })
      
      -- Register which-key mappings using the correct format
      wk.register({
        f = { 
          name = "File",
          f = { "<cmd>Telescope find_files<CR>", "Find File" },
          r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
          n = { "<cmd>enew<CR>", "New File" },
        },
        
        e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
        
        b = { 
          name = "Buffer",
          n = { "<cmd>bnext<CR>", "Next Buffer" },
          p = { "<cmd>bprevious<CR>", "Previous Buffer" },
          d = { "<cmd>bdelete<CR>", "Delete Buffer" },
        },
        
        c = { "<cmd>Telescope commands<CR>", "Commands" },
        h = { "<cmd>Telescope help_tags<CR>", "Help" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
        
        s = { 
          name = "Settings",
          n = { "<cmd>set number!<CR>", "Toggle Line Numbers" },
          r = { "<cmd>set relativenumber!<CR>", "Toggle Relative Numbers" },
          w = { "<cmd>set wrap!<CR>", "Toggle Word Wrap" },
        },
      }, { prefix = "<leader>" })
    end
  }
}
