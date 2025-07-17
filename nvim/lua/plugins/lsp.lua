local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

vim.lsp.enable('zls')
vim.lsp.enable('tinymist')
vim.lsp.enable('kotlin-language-server')
vim.lsp.enable('dartls')

vim.diagnostic.config({
  virtual_text = true,
})

now(function()
  add({
    source = 'neovim/nvim-lspconfig',
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>grn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
end)
