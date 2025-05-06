local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'folke/zen-mode.nvim',
  })

  require('zen-mode').setup()
end)
