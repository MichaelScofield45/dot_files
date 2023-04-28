return {
    {
        "numToStr/Comment.nvim",
        config = true
    },
    {
        "windwp/nvim-autopairs",
        opts = {
            disable_filetype = { "fennel" }
        }
    },
    {
        "kylechui/nvim-surround",
        config = true
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("tokyonight-night")
        end
    },
    {
        "NTBBloodbath/sweetie.nvim",
        lazy = false,
        -- config = function()
        --     vim.cmd.colorscheme("sweetie")
        -- end
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = {
                width = 90,
                options = {
                    number = false,
                    colorcolumn = "0"
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
        "TimUntersberger/neogit",
        cmd = "Neogit"
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
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path"
        }
    },
    "L3MON4D3/LuaSnip",
    {
        "nvim-telescope/telescope.nvim",
        lazy = true
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    {
        "nvim-lualine/lualine.nvim",
        -- lazy = true,
        dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
        opts = {
            theme = "tokyonight"
        }
    },
    {
        "nvim-neorg/neorg",
        ft = "norg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            semester = "~/Documents/Feb-Jun2023"
                        }
                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                }
            }
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    }
}
