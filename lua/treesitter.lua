-- Neorg setup to work with treesitter
-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

require('nvim-treesitter.configs').setup {
  ensure_installed = { "norg", "cpp", "c", "javascript", "python", "lua", "zig", "gitcommit", "git_rebase", "rust" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
