---------------------------------Bootstrap--------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<Space>", "<NOP>", {silent = true, noremap = true} )
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.loader.enable()

require("lazy").setup("plugins")
require("keymappings")
require("treesitter")
require("lsp")
require("myfuncs")
require("autocommands")
require("settings")
