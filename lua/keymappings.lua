-- My Stuff
local myfuncs = require("myfuncs")
vim.keymap.set("n", "<leader>[", myfuncs.write_new_line_before)
vim.keymap.set("n", "<leader>]", myfuncs.write_new_line_after)

vim.api.nvim_create_user_command("SetCompileCommand", myfuncs.set_makeprg, {})
vim.keymap.set("n", "<leader>cc", function ()
    vim.api.nvim_cmd({ cmd = "make" }, {})
end)

local wk = require("which-key")

wk.register({
    ["<leader>f"] = {
        name = "file",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep current file" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
        s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy find current buffer" },
        h = { "<cmd>Telescope help_tags<cr>", "Find en neovim manual" },
    },
    ["<leader>["] = { function() myfuncs.write_new_line_before() end, "Add newline on the line before" },
    ["<leader>]"] = { function() myfuncs.write_new_line_after() end, "Add newline on the line after" },
    gd = { function() vim.lsp.buf.definition() end, "Go to definition (lsp)" }
})

