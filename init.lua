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

-- Load keymaps after plugins
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require('keymaps')
  end,
})

-- Show a welcome message for beginners
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    if vim.fn.argc() == 0 then
      local msg = "Welcome to Neovim!\n" ..
        "• Press <leader>m (Space+m) for menu\n" ..
        "• Press <C-e> (Ctrl+e) for file explorer\n" ..
        "• Press <C-p> (Ctrl+p) to find files\n" ..
        "• Press <C-s> (Ctrl+s) to save\n" ..
        "• Press <C-q> (Ctrl+q) to quit"
      
      vim.defer_fn(function()
        vim.notify(msg, "info", { title = "Beginner Tips", timeout = 10000 })
      end, 500)
    end
  end,
})


