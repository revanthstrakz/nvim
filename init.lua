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

-- Set cursor to block for better touch visibility
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'

-- Show a welcome message for beginners (fixed syntax)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      local msg = "Welcome to Neovim!\n" ..
        "• Press <leader>m (Space+m) for menu\n" ..
        "• Press <C-e> (Ctrl+e) for file explorer\n" ..
        "• Press <C-p> (Ctrl+p) to find files\n" ..
        "• Press <C-s> (Ctrl+s) to save\n" ..
        "• Press <C-q> (Ctrl+q) to quit"
      
      vim.notify(msg, "info", { title = "Beginner Tips", timeout = 10000 })
    end
  end,
})

-- Load keymaps (after plugins are loaded)
vim.defer_fn(function()
  if vim.fn.filereadable(vim.fn.stdpath('config') .. '/lua/keymaps.lua') == 1 then
    require('keymaps')
  end
end, 100)


