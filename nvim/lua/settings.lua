-- meta-accesors as short variables
local opt = vim.opt
local opt_local = vim.opt_local
local bo = vim.bo
local wo = vim.wo
local g = vim.g -- rarely used

-- General Settings
opt.hidden = true
opt.incsearch = true
opt.mouse = 'a'
opt.showmode = false
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.cursorline = true
opt.completeopt = { 'menuone', 'noselect', 'fuzzy', 'nosort' }
opt.wildoptions = { 'pum', 'tagfile', 'fuzzy' }
opt.laststatus = 3
opt.winbar = "%=%m %f"
opt.splitright = true
opt.splitbelow = false

bo.undofile = true

-- Tabs & Indentation
opt_local.tabstop = 4
opt_local.softtabstop = 4
opt_local.shiftwidth = 4
opt_local.tabstop = 4
opt_local.softtabstop = 4
opt_local.expandtab = true

wo.wrap = false
wo.number = true
wo.relativenumber = true
wo.foldmethod = "expr"
wo.foldexpr = [[nvim_treesitter#foldexpr()]]
wo.foldenable = false
wo.conceallevel = 3

g.netrw_banner = 0
