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
            require("mini.completion").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
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
      "L3MON4D3/LuaSnip",
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
