local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

require('mini.completion').setup({
  lsp_completion = { source_func = 'omnifunc', auto_setup = false },
})
local capabilities = MiniCompletion.get_lsp_capabilities()
vim.lsp.config('*', {capabilities = capabilities})

local on_attach = function(args)
  vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end
vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })
