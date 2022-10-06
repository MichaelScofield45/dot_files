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
map( 'n','<Leader>p',  ':lua require("nabla").popup()<CR>' , options )

-- <ESC>(x2) in terminal mode
map( 't','<ESC><ESC>', '<C-\\><C-n>', options )

