-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true

-- Touch screen and mouse support
vim.opt.mouse = 'a'  -- Enable mouse support in all modes
vim.opt.mousefocus = true  -- Window focus follows mouse
vim.opt.mousemodel = 'popup_setpos'  -- Right-click shows a context menu

-- GUI-specific settings (for Neovim GUI frontends)
if vim.fn.exists('g:neovide') == 1 or vim.fn.exists('g:goneovim') == 1 or vim.fn.exists('g:nvui') == 1 then
  vim.opt.guifont = 'FiraCode Nerd Font:h12'  -- Set a readable font for GUI
  vim.opt.linespace = 1  -- Add slight spacing between lines for touch targets
end
