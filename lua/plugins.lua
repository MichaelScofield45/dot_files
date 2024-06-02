local handle = io.popen("readlink $(which luajit)")
local result = handle:read()
local luajit_include_path = "--with-lua-include=" .. string.gsub(result, "bin/luajit", "include/luajit-2.1")
handle:close()

return {
    -- {
    --     "echasnovski/mini.base16",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("mini.base16").setup({
    --             palette = {
    --                 base00 = "#151515",
    --                 base01 = "#202020",
    --                 base02 = "#303030",
    --                 base03 = "#505050",
    --                 base04 = "#B0B0B0",
    --                 base05 = "#D0D0D0",
    --                 base06 = "#E0E0E0",
    --                 base07 = "#F5F5F5",
    --                 base08 = "#AC4142",
    --                 base09 = "#D28445",
    --                 base0A = "#F4BF75",
    --                 base0B = "#90A959",
    --                 base0C = "#75B5AA",
    --                 base0D = "#6A9FB5",
    --                 base0E = "#AA759F",
    --                 base0F = "#8F5536"
    --             },
    --             use_cterm = true
    --         })
    --     end
    -- },
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
        keys = {
            { "ga" },
            { "ga", mode = "v" }
        }
    },
    -- {
    --     "echasnovski/mini.comment",
    --     config = true,
    --     keys = {
    --         { "gc" },
    --         { "gc", mode = "v"}
    --     }
    -- },
    {
        "echasnovski/mini.surround",
        config = true,
        keys = {
            { "s" },
            { "s", mode = "v" }
        }
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
        event = "InsertEnter"
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
        "nvim-treesitter/nvim-treesitter",
        -- event = "VeryLazy",
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
