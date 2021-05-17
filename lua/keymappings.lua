local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true}

map('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

-- Lexplore
map('n','<Leader>l', ':Lexplore<CR>', options )

-- <ESC> in terminal
map('t','<ESC><ESC>', '<C-\\><C-n>', options )

-- clear highlights in buffer
map('n','<Leader>cl', ':noh<CR>', options )

-- map('i','<C-Space>', 'compe#complete()', options )
-- map('i','<CR>',      'compe#confirm('<CR>')', options )
-- map('i','<C-e>',     'compe#close('<C-e>')', options )
