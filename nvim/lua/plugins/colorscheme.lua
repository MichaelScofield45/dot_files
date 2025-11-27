local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
require('mini.colors').setup()
vim.cmd([[colorscheme miniwinter]])

later(function()
  add({ source = 'webhooked/kanso.nvim' })
  require('kanso').setup({
  })
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
  })
end)

later(function()
  add({ source = 'ribru17/bamboo.nvim' })
  require('bamboo').setup()
end)

later(function()
  add({ source = 'Koalhack/darcubox-nvim' })
end)
