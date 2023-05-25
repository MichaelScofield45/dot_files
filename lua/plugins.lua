return {
    {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
        require("which-key").setup({})
      end
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.comment").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("tokyonight-night")
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
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        }
    },
    {
      "L3MON4D3/LuaSnip",
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope"
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
        cmd = "Neorg",
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
    },
    {
        "kaarmu/typst.vim",
        ft = "typst"
    }
}
