return {
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      'zbirenbaum/copilot-cmp',
    },
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
          lua = true,
          python = true,
          rust = true,
          javascript = true,
          typescript = true,
          ["*"] = true, -- Enable for all filetypes
        },
      })
      
      require('copilot_cmp').setup()
      
      -- Basic keybindings for Copilot
      vim.keymap.set('i', '<C-]>', function()
        if require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
        else
          return '<C-]>'
        end
      end, { expr = true, silent = true })
    end
  }
}
