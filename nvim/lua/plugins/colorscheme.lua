local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
require('mini.colors').setup()

now(function()
  add({ source = 'webhooked/kanso.nvim' })
  require('kanso').setup({
    transparent = true,
  })
  vim.cmd([[colorscheme kanso]])
end)

later(function()
  add({
    source = 'zenbones-theme/zenbones.nvim',
    depends = { 'rktjmp/lush.nvim' },
  })
end)

later(function()
  add({ source = 'rebelot/kanagawa.nvim' })
end)

later(function()
  add({ source = 'catppuccin/nvim' })
end)

later(function()
  add({ source = 'folke/tokyonight.nvim' })
  require('tokyonight').setup({
    style = 'night',
    transparent = true,
  })
end)
