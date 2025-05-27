-- Basic explanation of notation:
-- <CR> = Enter key
-- <C-x> = Ctrl+x
-- <A-x> = Alt+x
-- <S-x> = Shift+x
-- <leader> = Space key (as configured in init.lua)

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save file
keymap('n', '<C-s>', ':w<CR>', opts)
keymap('i', '<C-s>', '<Esc>:w<CR>', opts)

-- Quit
keymap('n', '<C-q>', ':q<CR>', opts)

-- Explorer (using Neo-tree, more touch-friendly)
keymap('n', '<C-e>', ':Neotree toggle<CR>', opts)
keymap('n', '<leader>e', ':Neotree focus<CR>', opts)

-- Find files (Telescope)
keymap('n', '<C-p>', ':Telescope find_files<CR>', opts)
keymap('n', '<C-f>', ':Telescope live_grep<CR>', opts)

-- Search in current file
keymap('n', '<C-h>', '/', opts) -- Start search
keymap('n', 'n', 'n', opts) -- Next match
keymap('n', 'N', 'N', opts) -- Previous match

-- Search and Replace
keymap('n', '<leader>r', ':Spectre<CR>', opts) -- Global search and replace
keymap('n', '<leader>R', ':%s//', { noremap = true }) -- Replace in current file (type what to search after /)

-- Copy, Cut, Paste (Vim style)
-- Normal mode
keymap('n', 'yy', 'yy', opts) -- Copy line
keymap('n', 'dd', 'dd', opts) -- Cut line
keymap('n', 'p', 'p', opts)   -- Paste after cursor
keymap('n', 'P', 'P', opts)   -- Paste before cursor

-- Visual mode
keymap('v', 'y', 'y', opts)   -- Copy selection
keymap('v', 'd', 'd', opts)   -- Cut selection
keymap('v', 'p', 'p', opts)   -- Paste over selection

-- Additional Clipboard integration (works with system clipboard)
keymap('n', '<leader>y', '"+y', opts)      -- Copy to system clipboard
keymap('v', '<leader>y', '"+y', opts)      -- Copy selection to system clipboard
keymap('n', '<leader>p', '"+p', opts)      -- Paste from system clipboard
keymap('n', '<C-a>', 'ggVG', opts)         -- Select all text

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opts) -- Move to left window
keymap('n', '<C-j>', '<C-w>j', opts) -- Move to window below
keymap('n', '<C-k>', '<C-w>k', opts) -- Move to window above
keymap('n', '<C-l>', '<C-w>l', opts) -- Move to right window

-- Beginner-friendly undo/redo
keymap('n', '<C-z>', 'u', opts)       -- Undo
keymap('n', '<C-y>', '<C-r>', opts)   -- Redo

-- Easy way to exit insert mode
keymap('i', 'jk', '<Esc>', opts)

-- Touch-friendly menu
keymap('n', '<leader>m', ":lua require('which-key').show()<CR>", opts)

-- Quick command palette
keymap('n', '<leader>c', ":Telescope commands<CR>", opts)

-- Help
keymap('n', '<leader>h', ":Telescope help_tags<CR>", opts)

-- Show keymaps
keymap('n', '<leader>k', ":Telescope keymaps<CR>", opts)

-- Quick settings menu (explained for beginners)
keymap('n', '<leader>s', function()
  local menu = {
    { 'Toggle Line Numbers', ':set nu! rnu!<CR>' },
    { 'Toggle Mouse Support', ':set mouse=a<CR>' },
    { 'Toggle File Explorer', ':Neotree toggle<CR>' },
    { 'Change Color Theme', ':Telescope colorscheme<CR>' },
    { 'Toggle Word Wrap', ':set wrap!<CR>' },
  }
  
  vim.ui.select(menu, {
    prompt = "Quick Settings:",
    format_item = function(item) return item[1] end,
  }, function(choice)
    if choice then
      vim.cmd(choice[2])
    end
  end)
end, opts)

keymap('n', '<leader>?', ":lua require('beginner_help').show_help()<CR>", opts)
