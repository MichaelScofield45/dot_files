local rocks_config = {
    rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "*", "*"))
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("settings")
require("keymappings")
require("myfuncs")
require("autocommands")
require("lsp")

vim.cmd.colorscheme("nightfox")

require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.jump").setup()
require("mini.completion").setup()

require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", {})
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>", {})
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Pick live_grep<cr>", {})

require("mini.statusline").setup()
