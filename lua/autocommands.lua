local api = vim.api

api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.norg", "*.md" },
    callback = function()
        vim.bo.textwidth = 80
    end
})
