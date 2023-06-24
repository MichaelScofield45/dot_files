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
        version = false,
        config = function()
            require("mini.comment").setup({})
            require("mini.completion").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
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
                theme = "kanagawa",
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
                            semester = "~/Documents/Feb-Jun2023"
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
    {
        "ramojus/mellifluous.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("mellifluous").setup({})
            vim.cmd([[colorscheme mellifluous]])
        end
    },
    {
        "ribru17/bamboo.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("bamboo").setup({})
            vim.cmd([[colorscheme bamboo]])
        end
    },
    {
        "rebelot/kanagawa.nvim",
        -- lazy = true,
        priority = 1000,
        config = function()
            require("kanagawa").setup({})
            vim.cmd([[colorscheme kanagawa]])
        end
    }
}
