local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

lspconfig.clangd.setup {
  capabilities = capabilities,
}

-- lspconfig.tsserver.setup{}

lspconfig.denols.setup{
  capabilities = capabilities,
}

lspconfig.pyright.setup{
  capabilities = capabilities,
}

lspconfig.gopls.setup{
  capabilities = capabilities,
}

-- Completion engine setup
local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        -- You must install `vim-vsnip` if you use the following as-is.
        vim.fn['vsnip#anonymous'](args.body)
      end
    },

    mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },

    -- You should specify your *installed* sources.
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      -- { name = 'nvim_lua' },
      { name = 'vsnip' },
	  { name = 'neorg' }
    },
  }
