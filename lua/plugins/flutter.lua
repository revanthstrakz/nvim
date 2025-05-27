return {
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('flutter-tools').setup({
        -- Uncomment below line for Windows only
        -- flutter_path = "home/flutter/bin/flutter.bat",
        
        debugger = {
          -- Set these to true when you want to use debug mode
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = {"flutter"}
            }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch Flutter",
                dartSdkPath = os.getenv("HOME") .. "/flutter/bin/cache/dart-sdk/",
                flutterSdkPath = os.getenv("HOME") .. "/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              }
            }
            -- Uncomment below line if you have launch.json file from VSCode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          -- Toggle this when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = function(client, bufnr)
            -- Add any specific LSP configurations here
            -- Basic keybindings for LSP functionality
            local opts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
        -- Flutter specific commands
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = "//",
          enabled = true,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        fvm = true, -- Support for Flutter version management if you use FVM
      })
      
      -- Add Flutter commands keymaps
      vim.keymap.set('n', '<leader>fr', ":FlutterRun<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fq', ":FlutterQuit<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fR', ":FlutterRestart<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fD', ":FlutterDevices<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fd', ":FlutterDevTools<CR>", { noremap = true, silent = true })
    end
  },
  
  -- For Dart syntax highlighting
  {
    'dart-lang/dart-vim-plugin',
  }
}
