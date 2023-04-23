local options = { noremap = true, silent = true }

-- Lexplore
vim.keymap.set( "n","<Leader>l",  ":15Lexplore<CR>" , options )

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, options)
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, options)
vim.keymap.set("n", "<Leader>fb", builtin.buffers, options)
vim.keymap.set("n", "<Leader>fs", builtin.current_buffer_fuzzy_find, options)
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, options)

-- My Stuff
local myfuncs = require("myfuncs")
vim.keymap.set("n", "<leader>[", myfuncs.write_new_line_before)
vim.keymap.set("n", "<leader>]", myfuncs.write_new_line_after)

vim.api.nvim_create_user_command("SetCompileCommand", myfuncs.set_makeprg, {})
vim.keymap.set("n", "<leader>cc", function ()
    vim.api.nvim_cmd({ cmd = "make" }, {})
end)

-- vim.keymap.set("i", "<C-o>-", "—")
-- vim.keymap.set("i", "<C-o>>", "»")

