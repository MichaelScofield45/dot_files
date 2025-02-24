local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'saghen/blink.cmp',
    depends = { 'rafamadriz/friendly-snippets' },
    checkout = 'v0.12.4',
  })


  require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  })
end)
