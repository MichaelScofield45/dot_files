local api = vim.api

api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.norg", "*.md", "*.typ", "*.myfile" },
  callback = function()
    vim.bo.textwidth = 80
    local new_fo, n_subs = string.gsub(vim.bo.formatoptions, "l", "t")
    if n_subs ~= 0 then
      vim.bo.formatoptions = new_fo
    else
      if not string.match(vim.bo.formatoptions, "t") then
        vim.bo.formatoptions = vim.bo.formatoptions .. "t"
      end
    end
  end
})
