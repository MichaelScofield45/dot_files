return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
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
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signcolumn = false
            })
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = {
                width = 90,
                options = {
                    number = false,
                    colorcolumn = "0",
                }
            },
            plugins = {
                options = {
                    cmdheight = 1
                }
            }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = true
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        build = ":Neorg sync-parsers",
        opts = {
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
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
            }
        },
    },
    {
        "kaarmu/typst.vim",
        ft = "typst"
    },
}
