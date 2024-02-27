return {
    {
        "echasnovski/mini.base16",
        lazy = false,
        priority = 1000,
        config = function()
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
        end
    },
    {
        "echasnovski/mini.statusline",
        lazy = false,
        priority = 900,
        config = true
    },
    {
        "echasnovski/mini.ai",
        config = true,
        priority = 10
    },
    {
        "echasnovski/mini.align",
        config = true,
        keys = "ga"
    },
    {
        "echasnovski/mini.comment",
        config = true,
        keys = "gc"
    },
    {
        "echasnovski/mini.surround",
        config = true,
        keys = "s"
    },
    {
        "echasnovski/mini.pick",
        config = true,
        keys = {
            { "<leader>ff", "<cmd>Pick files<cr>" },
            { "<leader>fg", "<cmd>Pick grep_live<cr>" },
            { "<leader>fb", "<cmd>Pick buffers<cr>" },
            { "<leader>fh", "<cmd>Pick help<cr>" }
        }
    },
    {
        "echasnovski/mini.pairs",
        config = true,
        priority = 10
    },
    {
        "echasnovski/mini.completion",
        config = true,
        priority = 10
    },

    {
        "echasnovski/mini.splitjoin",
        config = true,
        keys = "gS"
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function() vim.cmd("TSUpdate") end,
        config = function()
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
        "folke/zen-mode.nvim",
        config = true,
        cmd = "ZenMode"
    },
    {
        "nvim-neorg/neorg",
        build = function() vim.cmd("Neorg sync-parsers") end,
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Neorg",
        ft = "norg",
        config = function()
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
        end
    }

}
