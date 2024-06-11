local handle = io.popen("readlink $(which luajit)")
local result = handle:read()
local luajit_include_path = "--with-lua-include=" .. string.gsub(result, "bin/luajit", "include/luajit-2.1")
handle:close()

return {
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
        "echasnovski/mini.jump",
        config = true,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.align",
        config = true,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.surround",
        config = true,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.pick",
        config = true,
        keys = {
            {'<leader>ff', '<cmd>Pick files<cr>'},
            {'<leader>fb', '<cmd>Pick buffers<cr>'},
            {'<leader>fh', '<cmd>Pick help<cr>'},
            {'<leader>fg', '<cmd>Pick grep_live<cr>'},
        },
    },
    {
        "echasnovski/mini.pairs",
        config = true,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.completion",
        config = true,
        event = "VeryLazy"
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
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        init = function()
            -- this is an example, not a default. Please see the readme for more configuration options
            vim.g.molten_output_win_max_height = 12
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function() vim.cmd("TSUpdate") end,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
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
        "vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {
            luarocks_build_args = {luajit_include_path}
        }
    },
    {
        "nvim-neorg/neorg",
        dependencies = {"luarocks.nvim"},
        version = "*",
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
    },

    require("lsp"),
}
