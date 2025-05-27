local M = {}

M.show_help = function()
  local help_text = [[
# Neovim Beginner's Cheatsheet

## Basic Operations

| Shortcut       | Action                       |
|----------------|------------------------------|
| <C-s>          | Save file                    |
| <C-q>          | Quit                         |
| <Esc> or jk    | Exit insert mode             |
| i              | Enter insert mode            |
| :w             | Save file                    |
| :q             | Quit                         |
| :wq            | Save and quit                |

## Navigation

| Shortcut       | Action                       |
|----------------|------------------------------|
| h, j, k, l     | Move left, down, up, right   |
| w              | Move forward one word        |
| b              | Move backward one word       |
| gg             | Go to top of file            |
| G              | Go to bottom of file         |
| <C-u>          | Scroll up half page          |
| <C-d>          | Scroll down half page        |

## Explorer & Finding Files

| Shortcut       | Action                       |
|----------------|------------------------------|
| <C-e>          | Toggle file explorer         |
| <leader>e      | Focus file explorer          |
| <C-p>          | Find files                   |
| <C-f>          | Search in files              |

## Editing

| Shortcut       | Action                       |
|----------------|------------------------------|
| yy             | Copy line                    |
| dd             | Cut line                     |
| p              | Paste after cursor           |
| P              | Paste before cursor          |
| u or <C-z>     | Undo                         |
| <C-r> or <C-y> | Redo                         |
| <C-a>          | Select all text              |

## Search & Replace

| Shortcut       | Action                       |
|----------------|------------------------------|
| /              | Search in file               |
| n              | Next match                   |
| N              | Previous match               |
| <leader>r      | Global search and replace    |
| <leader>R      | Replace in current file      |

## Windows & Tabs

| Shortcut       | Action                       |
|----------------|------------------------------|
| <C-Left/Down/Up/Right> | Navigate between windows     |
| :split         | Split window horizontally    |
| :vsplit        | Split window vertically      |
| :tabnew        | Create new tab               |
| gt             | Go to next tab               |
| gT             | Go to previous tab           |

## Special Keys Explained

| Notation       | Meaning                      |
|----------------|------------------------------|
| <CR>           | Enter key                    |
| <C-x>          | Ctrl+x                       |
| <A-x>          | Alt+x                        |
| <S-x>          | Shift+x                      |
| <leader>       | Space key                    |
]]

  -- Create a scratch buffer
  vim.cmd('enew')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=hide')
  vim.cmd('setlocal noswapfile')
  
  -- Set buffer name
  vim.api.nvim_buf_set_name(0, 'Neovim Beginner Help')
  
  -- Insert help text
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(help_text, '\n'))
  
  -- Set filetype to markdown for nice formatting
  vim.cmd('setlocal filetype=markdown')
  vim.cmd('setlocal nomodifiable')
  vim.cmd('setlocal readonly')
  
  -- Add a keymap to close the help
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':bd<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Esc>', ':bd<CR>', { noremap = true, silent = true })
  
  -- Show a message about how to close
  vim.api.nvim_echo({{'Press q or <Esc> to close this help', 'WarningMsg'}}, true, {})
end

return M
  
  -- Add a keymap to close the help
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':bd<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<Esc>', ':bd<CR>', { noremap = true, silent = true })
  
  -- Show a message about how to close
  vim.api.nvim_echo({{'Press q or <Esc> to close this help', 'WarningMsg'}}, true, {})
end

return M
