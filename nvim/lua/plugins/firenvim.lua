local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'glacambre/firenvim',
    -- hooks = { post_install = function() vim.cmd('call firenvim#install(0)') end }
  })
end)
