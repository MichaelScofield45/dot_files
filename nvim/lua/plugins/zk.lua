local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({ source = 'zk-org/zk-nvim' })
  require('zk').setup()
end)
