local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'qlacambre/firenvim',
  })
  -- vim.cmd([[:call firenvim#install(0)]])
end)
