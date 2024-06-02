vim.api.nvim_create_augroup("ProseWriting", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "ProseWriting",
  pattern = { "norg", "markdown", "typst" },
  callback = function()
    vim.bo.textwidth = 80
    vim.bo.formatoptions = "jcroqt"
    vim.keymap.set('n', '<leader>fp', 'gwip', {buffer = 0})
  end,
})
