local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local function t(str) 
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

map('n', '<Space>', '<NOP>', options )
vim.g.mapleader = ' '

-- Lexplore
map( 'n','<Leader>l',  ':15Lexplore<CR>' , options )

-- Nabla
vim.keymap.set('n', '<Leader>p', require("nabla").popup, {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
