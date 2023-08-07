return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.comment").setup({})
            require("mini.completion").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
            require("mini.ai").setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                terminal_colors = true
            })
            vim.cmd([[colorscheme tokyonight]])
        end
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
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope"
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        opts = {
            options = {
                theme = "tokyonight",
            }
        }
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
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            semester = "~/Documents/Feb-Jun2023",
                            summer = "~/Documents/EstudioVerano"
                        }
                    }
                }
            }
        },
    },
    {
        "kaarmu/typst.vim",
        ft = "typst"
    },
}
