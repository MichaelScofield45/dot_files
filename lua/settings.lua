-- meta-accesors as short variables
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g -- rarely used

-- General Settings
o.hidden = true
o.incsearch = true
o.mouse = 'a'
o.showmode = false
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.completeopt = "menuone,noselect"
o.shortmess = o.shortmess .. 'c'
o.laststatus = 3
o.winbar = "%=%m %f"

bo.undofile = true

-- Tabs & Indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

wo.wrap = false
wo.colorcolumn = "80"
wo.cursorline = true
wo.number = true
wo.relativenumber = true
wo.foldmethod = "expr"
wo.foldexpr = [[nvim_treesitter#foldexpr()]]
wo.foldenable = false
wo.conceallevel = 3

g.netrw_banner = 0
g.splitright = true
g.splitbelow = false
g.autochdir = true

