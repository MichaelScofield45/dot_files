local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'm4xshen/hardtime.nvim',
  })

  require('hardtime').setup()
end)

