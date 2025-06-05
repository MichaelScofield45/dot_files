local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local gen_loader = require('mini.snippets').gen_loader

now(function()
  add({ source = 'rafamadriz/friendly-snippets' })
end)

require('mini.completion').setup()
require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file('~/.config/dot_files/nvim/snippets/global.json'),
    gen_loader.from_lang(),
  },
})
MiniSnippets.start_lsp_server()
