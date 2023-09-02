return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.comment").setup({})
            -- require("mini.completion").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
            require("mini.ai").setup({})
        end
    },
    {
        "L3MON4D3/LuaSnip",
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- build = "make install_jsregexp"
        config = function()
            local ls = require("luasnip")
            vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})
        end;
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })
        end,
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
