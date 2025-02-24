vim.api.nvim_buf_create_user_command(
  0,
  'ProseAutoFormat',
  function()
    vim.bo.textwidth = 80
    vim.bo.formatoptions = "jroqa"
    vim.keymap.set('n', '<localleader>fp', 'gwip', {buffer = 0})
  end,
  {}
)
