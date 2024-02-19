local add = MiniDeps.add
local now = MiniDeps.now
local later = MiniDeps.later

now(function ()
    require("mini.base16").setup({
        palette = {
            base00 = "#151515",
            base01 = "#202020",
            base02 = "#303030",
            base03 = "#505050",
            base04 = "#B0B0B0",
            base05 = "#D0D0D0",
            base06 = "#E0E0E0",
            base07 = "#F5F5F5",
            base08 = "#AC4142",
            base09 = "#D28445",
            base0A = "#F4BF75",
            base0B = "#90A959",
            base0C = "#75B5AA",
            base0D = "#6A9FB5",
            base0E = "#AA759F",
            base0F = "#8F5536"
        },
        use_cterm = true
    })
end)

now(function()
    add("nvim-tree/nvim-web-devicons")
    require("nvim-web-devicons").setup()
end)

now(function() require("mini.statusline").setup() end)

later(function()
    add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
    })
    require('nvim-treesitter.configs').setup {
        ensure_installed = {
            "norg",
            "cpp",
            "c",
            "javascript",
            "python",
            "lua",
            "zig",
            "gitcommit",
            "git_rebase",
            "rust"
        },
        highlight = { enable = true }
    }
end)

later(function()
    add("lewis6991/gitsigns.nvim")
    require("gitsigns").setup({
        signcolumn = false
    })
end)

later(function() require("mini.animate").setup() end)
later(function() require("mini.completion").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.pick").setup() end)
later(function() require("mini.surround").setup() end)
later(function() require("mini.comment").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.ai").setup() end)
later(function() require("mini.splitjoin").setup() end)

later(function()
    add({
        source = "folke/zen-mode.nvim",
    })
end)

later(function()
    add({
        source = "nvim-neorg/neorg",
        hooks = { post_checkout = function() vim.cmd("Neorg sync-parsers") end },
        depends = { "nvim-lua/plenary.nvim" }
    })
    require("neorg").setup({
        load = {
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
            }
        }
    })
end)
