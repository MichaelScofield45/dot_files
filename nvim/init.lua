-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

vim.keymap.set("n", "<Space>", "<NOP>", {silent = true, noremap = true} )
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- meta-accesors as short variables
local opt = vim.opt
local opt_local = vim.opt_local
local bo = vim.bo
local wo = vim.wo
local g = vim.g -- rarely used

-- General Settings
opt.hidden = true
opt.incsearch = true
opt.mouse = 'a'
opt.showmode = false
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.cursorline = true
opt.completeopt = { 'menuone', 'noselect', 'fuzzy' }
opt.wildoptions = { 'pum', 'fuzzy' }
opt.wildignorecase = true
opt.pumheight = 10

if vim.fn.has('nvim-0.12') == 1 then
  opt.pummaxwidth = 100
  opt.pumborder = 'single'
  -- require('vim._extui').enable({ enable = true })
end

opt.winborder = 'single'
opt.laststatus = 3
opt.winbar = "%=%m %f"
opt.splitright = true
opt.splitbelow = false

bo.undofile = true

-- Tabs & Indentation
opt_local.tabstop = 4
opt_local.softtabstop = 4
opt_local.shiftwidth = 4
opt_local.tabstop = 4
opt_local.softtabstop = 4
opt_local.expandtab = true

wo.wrap = false
wo.number = true
wo.relativenumber = true
wo.foldmethod = "expr"
wo.foldexpr = [[nvim_treesitter#foldexpr()]]
wo.foldenable = false
wo.conceallevel = 3

g.netrw_banner = 0

vim.keymap.set('n', '<leader>w', '<cmd>update<cr>')

vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })


vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

local on_attach = function(args)
  vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end
vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

vim.cmd.packadd('nvim.undotree')
vim.keymap.set("n", "<leader>u", function()
	require("undotree").open({
		command = math.floor(vim.api.nvim_win_get_width(0) / 3) .. "vnew",
	})
end, { desc = "[U]ndotree toggle" })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.cmdline').setup()
require('mini.clue').setup()

later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.operators').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.jump').setup() end)
later(function() require('mini.extra').setup() end)
later(function()
  require('mini.files').setup()
  vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>')
end)
later(function() require('mini.surround').setup() end)
later(function()
  require('mini.pick').setup()
  vim.keymap.set('n', '<leader>f', '<cmd>Pick files<cr>')
  vim.keymap.set('n', '<leader>g', '<cmd>Pick grep_live<cr>')
  vim.keymap.set('n', '<leader>b', '<cmd>Pick buffers<cr>')
  vim.keymap.set('n', '<leader><leader>h', '<cmd>Pick history<cr>')
  vim.keymap.set('n', '<leader>h', '<cmd>Pick help<cr>')
  vim.keymap.set('n', '<leader><leader>c', '<cmd>Pick commands<cr>')
  vim.keymap.set('n', '<leader>c', '<cmd>Pick colorschemes<cr>')
  vim.keymap.set('n', '<leader>k', '<cmd>Pick keymaps<cr>')
  vim.keymap.set('n', '<leader>m', '<cmd>Pick marks<cr>')
end)
later(function()
  require('mini.trailspace').setup()
  vim.keymap.set('n', '<leader>tr', MiniTrailspace.trim)
  vim.keymap.set('n', '<leader>tl', MiniTrailspace.trim_last_lines)
end)
later(function()
  require('mini.pairs').setup({
    mappings = {
      ['¿'] = { action = 'open', pair = '¿?', neigh_pattern = '[^\\].' },
      ['¡'] = { action = 'open', pair = '¡!', neigh_pattern = '[^\\].' },
      ['«'] = { action = 'open', pair = '«»', neigh_pattern = '[^\\].' },
      ['?'] = { action = 'close', pair = '¿?', neigh_pattern = '[^\\].' },
      ['!'] = { action = 'close', pair = '¡!', neigh_pattern = '[^\\].' },
      ['»'] = { action = 'close', pair = '«»', neigh_pattern = '[^\\].' },
    }
  })
end)

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

require('mini.completion').setup({
  lsp_completion = { source_func = 'omnifunc', auto_setup = false },
})
local capabilities = MiniCompletion.get_lsp_capabilities()
vim.lsp.config('*', {capabilities = capabilities})

local on_attach = function(args)
  vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end
vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

now(function()
  add({ source = 'https://github.com/vague-theme/vague.nvim' })
  vim.cmd.colorscheme('vague')
end)

now(function ()
	add({ source = 'nvim-orgmode/orgmode' })
	require('orgmode').setup({
		org_agenda_files = '~/Documents/notes.org',
		org_default_notes_file = '~/Documents/notes.org',
	})
end)

vim.lsp.enable('zls')
vim.lsp.enable('tinymist')
vim.lsp.enable('kotlin-language-server')
vim.lsp.enable('dartls')

vim.diagnostic.config({
  virtual_text = true,
})

now(function()
  add({
    source = 'neovim/nvim-lspconfig',
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>grn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
end)

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  -- Possible to immediately execute code which depends on the added plugin
  require('nvim-treesitter.configs').setup({
    ensure_installed = {'lua', 'vimdoc', 'markdown', 'zig', 'gitcommit', 'python',},
    highlight = {
      enable = true,
    },
  })
end)

later(function()
  add({ source = 'folke/zen-mode.nvim', })
  require('zen-mode').setup()
end)
