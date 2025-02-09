vim.api.nvim_create_augroup("ProseWriting", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "ProseWriting",
  pattern = { "norg", "markdown", "typst" },
  callback = function()
    vim.bo.textwidth = 80
    vim.bo.formatoptions = "jroqa"
    vim.keymap.set('n', '<localleader>fp', 'gwip', {buffer = 0})
  end,
})

vim.api.nvim_create_augroup("TwoSpaceIndent", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "TwoSpaceIndent",
  pattern = { "nix", "lua" },
  callback = function()
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 0
  end,
})
