-- My Stuff
local myfuncs = require("myfuncs")
vim.keymap.set("n", "<leader>[", myfuncs.write_new_line_before)
vim.keymap.set("n", "<leader>]", myfuncs.write_new_line_after)

vim.api.nvim_create_user_command("SetCompileCommand", myfuncs.set_makeprg, {})
vim.keymap.set("n", "<leader>cc", function ()
    vim.api.nvim_cmd({ cmd = "make" }, {})
end)

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
