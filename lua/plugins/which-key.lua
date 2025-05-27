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
      
      -- Register which-key mappings using the new specification format
      wk.register({
        { "<leader>f", group = "File" },
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
        { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
        { "<leader>fn", "<cmd>enew<CR>", desc = "New File" },
        
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
        
        { "<leader>b", group = "Buffer" },
        { "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
        { "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer" },
        { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
        
        { "<leader>c", "<cmd>Telescope commands<CR>", desc = "Commands" },
        { "<leader>h", "<cmd>Telescope help_tags<CR>", desc = "Help" },
        { "<leader>k", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
        
        { "<leader>s", group = "Settings" },
        { "<leader>sn", "<cmd>set number!<CR>", desc = "Toggle Line Numbers" },
        { "<leader>sr", "<cmd>set relativenumber!<CR>", desc = "Toggle Relative Numbers" },
        { "<leader>sw", "<cmd>set wrap!<CR>", desc = "Toggle Word Wrap" },
      })
    end
  }
}
  }
}
