return {
    {
        "echasnovski/mini.statusline",
        lazy = false,
        priority = 900,
        config = true
    },
    {
        "echasnovski/mini.hues",
        lazy = false,
        priority = 900,
        config = function() 
            vim.cmd([[colorscheme randomhue]])
         end
    },
    {
        "echasnovski/mini.ai",
        config = true,
        event = "VeryLazy"
    },
    {
        "echasnovski/mini.align",
        config = true,
        event = "VeryLazy"
    },
    {
        "echasnovski/mini.comment",
        config = true,
        event = "VeryLazy"
    },
    {
        "echasnovski/mini.surround",
        config = true,
        event = "VeryLazy"
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
        event = "VeryLazy"
    },
    {
        "echasnovski/mini.completion",
        config = true,
        event = "VeryLazy"
    },

    {
        "echasnovski/mini.splitjoin",
        config = true,
        event = "VeryLazy"
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
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
        "folke/zen-mode.nvim",
        config = true,
        cmd = "ZenMode"
    },
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.keybinds"] = {},
                    ["core.ui.calendar"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                semester = "~/Documents/Feb-Jun2024",
                            }
                        }
                    }
                }
            })
            vim.wo.conceallevel = 2
        end
    }
}
