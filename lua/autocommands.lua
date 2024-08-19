local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = { "neorg", "markdown", "typst" },
  callback = function()
    vim.bo.textwidth = 80
    vim.bo.formatoptions = "jcnla"
  end
})
