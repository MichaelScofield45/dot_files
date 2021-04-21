-- meta-accesors as short variables
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

-- General Settings
o.hidden = true
o.incsearch = true
o.mouse = 'a'
o.showmode = false
-- o.noerrorbells = true
o.undodir = '~/.config/nvim/undodir'
o.termguicolors = true
-- o.clipboard = 'unnamedplus'

bo.expandtab = true

wo.colorcolumn = '80'
wo.number = true
wo.relativenumber = true

cmd('colorscheme spaceduck')
