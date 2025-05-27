return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup {
        defaults = {
          layout_strategy = 'vertical',
          layout_config = {
            vertical = {
              width = 0.8,
              height = 0.9,
              preview_height = 0.5,
            },
            prompt_position = 'top',
          },
          sorting_strategy = 'ascending',
          borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
          -- Larger icons for better touch targets
          entry_prefix = "  ",
          selection_caret = "❯ ",
          path_display = { "truncate" },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
            layout_config = { width = 0.8 },
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
            layout_config = { width = 0.8 },
          },
        },
      }
      
      -- Telescope keymaps
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  }
}
