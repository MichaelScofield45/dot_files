return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
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
        "saghen/blink.cmp",
        dependencies = 'rafamadriz/friendly-snippets',

        version = 'v0.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- see the "default configuration" section below for full documentation on how to define
            -- your own keymap.
            keymap = { preset = 'default' },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- will be removed in a future release
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'normal'
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { "sources.default" }
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
