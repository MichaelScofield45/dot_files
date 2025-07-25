local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
      local on_attach = function(args)
        vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
      end
      vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

now(function() require('mini.icons').setup() end)
now(function() require('mini.statusline').setup() end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.operators').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.jump').setup() end)
later(function() require('mini.extra').setup() end)
later(function()
  require('mini.files').setup()
  vim.keymap.set('n', '<leader>fi', '<cmd>lua MiniFiles.open()<cr>')
end)
later(function() require('mini.surround').setup() end)
later(function()
  require('mini.pick').setup()
  vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>')
  vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>')
  vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<cr>')
  vim.keymap.set('n', '<leader>fh', '<cmd>Pick history<cr>')
  vim.keymap.set('n', '<leader>fs', '<cmd>Pick help<cr>')
  vim.keymap.set('n', '<leader>fc', '<cmd>Pick commands<cr>')
  vim.keymap.set(
    'n',
    '<leader>fo',
    function()
      vim.cmd([[Pick colorschemes]])
    end
  )
  vim.keymap.set('n', '<leader>fk', '<cmd>Pick keymaps<cr>')
  vim.keymap.set('n', '<leader>fm', '<cmd>Pick marks<cr>')
end)
later(function()
  require('mini.trailspace').setup()
  vim.keymap.set('n', '<leader>tr', function() MiniTrailspace.trim() end)
  vim.keymap.set('n', '<leader>tl', function() MiniTrailspace.trim_last_lines() end)
end)
later(function()
  require('mini.pairs').setup({
    mappings = {
      ['¿'] = { action = 'open', pair = '¿?', neigh_pattern = '[^\\].' },
      ['¡'] = { action = 'open', pair = '¡!', neigh_pattern = '[^\\].' },
      ['?'] = { action = 'close', pair = '¿?', neigh_pattern = '[^\\].' },
      ['!'] = { action = 'close', pair = '¡!', neigh_pattern = '[^\\].' },
    }
  })
end)
