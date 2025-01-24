return {
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
