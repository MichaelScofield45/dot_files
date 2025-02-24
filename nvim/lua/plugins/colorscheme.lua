local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  require('mini.hues').setup({
    background = '#2b1a33',
    foreground = '#c9c5cb',
    saturation = 'lowmedium',
  })
  require('mini.colors').setup()
  MiniColors.get_colorscheme():add_transparency({ statuscolumn = true }):add_cterm_attributes():apply()
end)
