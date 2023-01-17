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
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.tabstop = 4
bo.softtabstop = 4
bo.expandtab = true

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = "*.lua",
  callback = function()
    bo.tabstop = 2
    bo.softtabstop = 2
    bo.shiftwidth = 2
    bo.tabstop = 2
    bo.softtabstop = 2
  end
})

wo.wrap = false
wo.colorcolumn = '80'
wo.number = true
wo.relativenumber = true
wo.foldmethod = "expr"
wo.foldexpr = [[nvim_treesitter#foldexpr()]]
wo.foldenable = false

g.netrw_banner = 0
g.splitright = true
g.splitbelow = false

