local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme("randomhue")
end)

now(function() require("mini.statusline").setup() end)

later(function() require("mini.ai").setup() end)
later(function() require("mini.surround").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.comment").setup() end)
later(function() require("mini.completion").setup() end)
later(function() require("mini.splitjoin").setup() end)
later(function() require("mini.extra").setup() end)
later(function()
    require("mini.pick").setup()
    vim.keymap.set("n",  "<leader>ff", "<cmd>Pick files<cr>")
    vim.keymap.set("n",  "<leader>fg", "<cmd>Pick grep_live<cr>")
    vim.keymap.set("n",  "<leader>fb", "<cmd>Pick buffers<cr>")
    vim.keymap.set("n",  "<leader>fh", "<cmd>Pick help<cr>" )
    vim.keymap.set("n",  "<leader>fl", "<cmd>Pick buf_lines<cr>" )
    vim.keymap.set("n",  "<leader>fm", "<cmd>Pick marks<cr>" )
end)

-- Use external plugins with `add()`
now(function()
  -- Add to current session (install if absent)
  add("nvim-tree/nvim-web-devicons")
  require("nvim-web-devicons").setup()
end)

now(function() add("neovim/nvim-lspconfig") end)

later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    -- Use "master" while monitoring updates in "main"
    checkout = "master",
    monitor = "main",
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
  })
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vimdoc", "zig", "gitcommit" },
    highlight = { enable = true },
  })
end)

now(function()
  add("folke/zen-mode.nvim")
  require("zen-mode").setup()
end)

    

    -- {
    --     "nvim-neorg/neorg",
    --     build = function() vim.cmd("Neorg sync-parsers") end,
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     cmd = "Neorg",
    --     ft = "norg",
    --     config = function()
    --         require("neorg").setup({
    --             load = {
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.ui.calendar"] = {},
    --                 ["core.dirman"] = {
    --                     config = {
    --                         workspaces = {
    --                             semester = "~/Documents/Feb-Jun2023",
    --                             summer = "~/Documents/EstudioVerano"
    --                         }
    --                     }
    --                 }
    --             }
    --         })
    --     end
    -- }

-- }
