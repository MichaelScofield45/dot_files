local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({ source = 'zk-org/zk-nvim' })
  require('zk').setup({
    picker = 'minipick',
    lsp = {
      config = {
        name = "zk",
        cmd = { "zk", "lsp" },
        filetypes = { "markdown" },
      },
      auto_attach = {
        enabled = true,
      },
    },
  })
end)
