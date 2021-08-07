local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local function t(str) 
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

map('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

-- Lexplore
map( 'n','<Leader>l',  ':Lexplore<CR>' , options )

-- <ESC> in terminal mode
map( 't','<ESC><ESC>', '<C-\\><C-n>', options )

-- clear highlights in buffer
map( 'n','<Leader>cl', ':noh<CR>', options )

-- nvim-compe
map( 'i','<C-Space>', [[ compe#complete() ]], { silent = true, expr = true } )
map( 'i','<CR>', [[ compe#confirm('<CR>') ]], { silent = true, expr = true } )
map( 'i','<C-e>', [[ compe#close('<C-e>') ]], { silent = true, expr = true } )

-- vim-vsnip
t'<Tab>'
t'<C-j>'
map( 'i','<C-j>', [[ vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>' ]], { expr = true } )
map( 's','<C-j>', [[ vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>' ]], { expr = true } )

map( 'i','<C-l>', [[ vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "<C-l>" ]], { expr = true } )
map( 's','<C-l>', [[ vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>' ]], { expr = true } )

map( 'i','<Tab>', [[ vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>' ]], { expr = true } )
map( 's','<Tab>', [[ vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>' ]], { expr = true } )

map( 'i','<S-Tab>', [[ vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>' ]], { expr = true } )
map( 's','<S-Tab>', [[ vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>' ]], { expr = true } )
