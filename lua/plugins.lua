local add = MiniDeps.add
local now = MiniDeps.now
local later = MiniDeps.later

add("echasnovski/mini.nvim")
now(function()
    require("mini.base16").setup({
        palette = require("mini.base16").mini_palette('#112641', '#e2e98f', 75),
        use_cterm = true
    })
end)
now(function() require("mini.statusline").setup() end)

later(function() require("mini.align").setup() end)
later(function() require("mini.comment").setup() end)
later(function() require("mini.completion").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.pick").setup() end)
later(function() require("mini.surround").setup() end)
later(function() require("mini.ai").setup() end)

add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
})

add("neovim/nvim-lspconfig")

add("lewis6991/gitsigns.nvim")
later(function()
    require("gitsigns").setup({
        signcolumn = false
    })
end)

add("nvim-tree/nvim-web-devicons")
-- require("nvim-web-devicons").setup()

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
