return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- Using the already configured copilot.lua plugin
      { "nvim-lua/plenary.nvim" }, -- Already a dependency for other plugins
    },
    build = function()
      -- Only run the build command on Unix-like systems (Linux/MacOS)
      if vim.fn.has('unix') == 1 then
        vim.fn.system("make tiktoken")
      end
    end,
    opts = {
      debug = false, -- Enable debugging
      show_help = true, -- Show help text for CopilotChatInPlace
      -- Prompts that will be used for specific actions in the Chat
      prompts = {
        Explain = "Explain how the following code works.",
        Review = "Review the following code and provide suggestions for improvement.",
        Tests = "Generate unit tests for the following code.",
        Refactor = "Refactor the following code to improve clarity and readability.",
        FixCode = "Fix the following code to correctly solve the problem.",
        BetterNamings = "Suggest better names for the variables and functions in the following code.",
        Documentation = "Write documentation for the following code.",
      },
      -- Key mappings
      mappings = {
        -- Close chat window
        close = {
          normal = "<C-c>",
          insert = "<C-c>",
        },
        -- Reset chat window
        reset = {
          normal = "<C-r>",
          insert = "<C-r>",
        },
        -- Submit query
        submit = {
          normal = "<CR>",
          insert = "<C-CR>",
        },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      
      -- Create command abbreviations for easier use
      vim.cmd[[cnoreabbrev CC CopilotChat]]
      vim.cmd[[cnoreabbrev CCE CopilotChatExplain]]
      vim.cmd[[cnoreabbrev CCT CopilotChatTests]]
      vim.cmd[[cnoreabbrev CCR CopilotChatReview]]
      vim.cmd[[cnoreabbrev CCF CopilotChatFixCode]]
      
      -- Add keymappings for common actions
      vim.keymap.set('n', '<leader>cc', ':CopilotChat<CR>', { noremap = true, silent = true, desc = 'CopilotChat' })
      vim.keymap.set('v', '<leader>cc', ':CopilotChatVisual<CR>', { noremap = true, silent = true, desc = 'CopilotChat Visual' })
      vim.keymap.set('n', '<leader>ce', ':CopilotChatExplain<CR>', { noremap = true, silent = true, desc = 'Explain Code' })
      vim.keymap.set('v', '<leader>ce', ':CopilotChatExplainVisual<CR>', { noremap = true, silent = true, desc = 'Explain Selected Code' })
      vim.keymap.set('n', '<leader>ct', ':CopilotChatTests<CR>', { noremap = true, silent = true, desc = 'Generate Tests' })
      vim.keymap.set('v', '<leader>ct', ':CopilotChatTestsVisual<CR>', { noremap = true, silent = true, desc = 'Generate Tests for Selection' })
      vim.keymap.set('n', '<leader>cr', ':CopilotChatReview<CR>', { noremap = true, silent = true, desc = 'Review Code' })
      vim.keymap.set('v', '<leader>cr', ':CopilotChatReviewVisual<CR>', { noremap = true, silent = true, desc = 'Review Selected Code' })
    end,
  }
}
