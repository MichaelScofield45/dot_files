-- meta-accesors as short variables
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local g = vim.g -- rarely used

-- General Settings
o.hidden = true
o.incsearch = true
o.mouse = 'a'
o.showmode = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.completeopt = "menuone,noselect"
o.shortmess = o.shortmess .. 'c'
o.laststatus = 3
o.winbar = "%=%m %f"

-- Tabs & Indentation
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
bo.expandtab = true
bo.shiftwidth = 4
bo.tabstop = 4
bo.softtabstop = 4

wo.wrap = false
wo.colorcolumn = '80'
wo.number = true
wo.relativenumber = true

g.netrw_banner = 0

vim.cmd([[colorscheme tokyonight]])
