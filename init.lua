-- Set <Space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load options
require('options')

-- Setup lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('lazy').setup('plugins')

-- Set up global keymaps that work well with touch
-- Create a floating menu for common actions
vim.api.nvim_set_keymap('n', '<leader>m', "<cmd>lua require('which-key').show()<CR>", { noremap = true, silent = true })

-- Add basic touch gestures if in GUI mode
if vim.fn.has('nvim-0.9') == 1 then
  -- Add any touch-specific configuration here when using GUI frontends
  -- This will be expanded in the future as Neovim GUI clients improve touch support
end

-- Set cursor to block for better touch visibility
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'

vim.cmd[[colorscheme tokyonight]]
require('nvim-tree').setup()

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


