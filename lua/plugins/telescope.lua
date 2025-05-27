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
          -- More beginner-friendly UI
          initial_mode = "insert",
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "truncate" },
          
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              width = 0.9,
              height = 0.8,
              preview_width = 0.6,
            },
            prompt_position = 'top',
          },
          
          sorting_strategy = 'ascending',
          file_ignore_patterns = {
            "node_modules", ".git", "dist", "build"
          },
          
          -- Help text at the bottom
          results_title = "Files (↑↓:Navigate, Enter:Open, Esc:Cancel)",
          
          mappings = {
            i = {
              -- More intuitive mappings
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-n>"] = "move_selection_next",
              ["<C-p>"] = "move_selection_previous",
              ["<Down>"] = "move_selection_next",
              ["<Up>"] = "move_selection_previous",
              ["<C-c>"] = "close",
              ["<C-u>"] = false,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = true,
            layout_config = { width = 0.8 },
          },
          live_grep = {
            theme = "dropdown",
          },
        },
      }
    end
  }
}
