local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({ source = 'webhooked/kanso.nvim' })
  require('kanso').setup()
  vim.cmd([[colorscheme kanso]])
end)
