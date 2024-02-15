local add = MiniDeps.add
local now = MiniDeps.now
local later = MiniDeps.later

add("echasnovski/mini.nvim")
require("mini.align").setup()
require("mini.comment").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.statusline").setup()
require("mini.base16").setup({
    palette = require("mini.base16").mini_palette('#112641', '#e2e98f', 75),
    use_cterm = true
})

add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
})

add("neovim/nvim-lspconfig")

add("lewis6991/gitsigns.nvim")
require("gitsigns").setup({
    colorcolumn = false
})

add("nvim-tree/nvim-web-devicons")

add("kaarmu/typst.vim")

add("nvim-lua/plenary.nvim")

add({
    source = "nvim-neorg/neorg",
    hooks = { post_checkout = function() vim.cmd(":Neorg sync-parsers") end },
})
later(function()
    require("neorg").setup({
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.ui.calendar"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    semester = "~/Documents/Feb-Jun2023",
                    summer = "~/Documents/EstudioVerano"
                }
            }
        },
    })
end)
