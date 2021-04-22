local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true}

map('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

-- Lexplore
map('n','<Leader>l', ':Lexplore<CR>', options )

-- <ESC> in terminal
map('t','<ESC>', '<C-\\><C-n>', options )
