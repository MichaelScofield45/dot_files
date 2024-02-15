-- NOTE: I don't know if this is even useful
MiniDeps.later(function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { "norg", "cpp", "c", "javascript", "python", "lua", "zig", "gitcommit", "git_rebase", "rust" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
end)
