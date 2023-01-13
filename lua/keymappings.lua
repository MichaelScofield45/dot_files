local options = { noremap = true, silent = true }
local function t(str) 
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Lexplore
vim.keymap.set( 'n','<Leader>l',  ':15Lexplore<CR>' , options )

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, options)
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, options)
vim.keymap.set('n', '<Leader>fb', builtin.buffers, options)
vim.keymap.set('n', '<Leader>fs', builtin.current_buffer_fuzzy_find, options)
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, options)
