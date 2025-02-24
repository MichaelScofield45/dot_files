local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'nvim-neorg/neorg',
  })

  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.keybinds"] = {},
      ["core.ui.calendar"] = {},
    }
  })
end)
