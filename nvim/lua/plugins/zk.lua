local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({ source = 'zk-org/zk-nvim' })
  require('zk').setup({ picker = 'minipick' })
  vim.keymap.set('n', '<leader>zo', '<Cmd>ZkNotes<CR>')
  vim.keymap.set('n', '<leader>zbl', '<Cmd>ZkBacklinks<CR>')
  vim.keymap.set('n', '<leader>zl', '<Cmd>ZkLinks<CR>')
  vim.keymap.set('v', '<leader>zf', ':ZkMatch<CR>')
  vim.keymap.set('v', '<leader>zt', ':ZkNewFromTitleSelection<CR>')
  vim.keymap.set('v', '<leader>zl', ':ZkInsertLinkAtSelection<CR>')
  vim.keymap.set('n', '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>")
end)
