-- My Stuff
local myfuncs = require("myfuncs")

vim.api.nvim_create_user_command("SetCompileCommand", myfuncs.set_makeprg, {})
vim.keymap.set("n", "<leader>cc", function ()
    vim.api.nvim_cmd({ cmd = "make" }, {})
end)
