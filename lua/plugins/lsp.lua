local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'saghen/blink.cmp' },
  })

  local lspconfig = require('lspconfig')
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local servers = { 'zls' }

  for _, lsp in ipairs(servers) do
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig[lsp].setup({capabilities = capabilities})
  end

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
end)
