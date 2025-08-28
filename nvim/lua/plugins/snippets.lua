local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local gen_loader = require('mini.snippets').gen_loader

local lang_patterns = {
  markdown_inline = { 'markdown.json' },
  xslt = { 'xml.json' },
}

require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file('~/.config/dot_files/nvim/snippets/global.json'),
    gen_loader.from_lang({ lang_patterns = lang_patterns }),
  },
})

-- MiniSnippets.start_lsp_server()
