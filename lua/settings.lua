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
o.hlsearch = false
o.undodir = '~/.config/nvim/undodir'
o.termguicolors = true

-- Tabs & Indentation
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
bo.expandtab = true
bo.shiftwidth = 4
bo.tabstop = 4
bo.softtabstop = 4

wo.colorcolumn = '80'
wo.number = true
wo.relativenumber = true

cmd('colorscheme gruvbox8')
