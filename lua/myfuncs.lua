local api = vim.api
local fn = vim.fn

local M = {}

M.compile_pandoc = function()
    local buffer = fn.expand("%")
    local filename = fn.expand("%:r")
    local extension = fn.expand("%:e")
    local command
    if (extension == "md") then
        if (vim.b.pandoc_command == nil or vim.b.pandoc_command == "") then
            command = string.format("pandoc %s -o %s.pdf", buffer, filename)
        else
            command = vim.b.pandoc_command
        end

        local handle = io.popen(command)

        if handle then
            handle:read("*a")
            handle:close()
        else
            api.nvim_err_writeln("ERROR: Pandoc command failed.")
        end

        api.nvim_echo({{"Pandoc compiling done."}}, false, {})
    else
        api.nvim_err_writeln("ERROR: Not a 'markdown' (.md) document.")
    end
end

M.pandoc_command = function()
    vim.b.pandoc_command = fn.input("Pandoc invocation: ")
end

M.write_new_line_before = function()
    local _, line, col, _, _ = unpack(fn.getcurpos())
    api.nvim_cmd({ cmd = "normal", args = {"O"} }, {})
    fn.cursor({line + 1, col})
end

M.write_new_line_after = function()
    local _, line, col, _, _ = unpack(fn.getcurpos())
    api.nvim_cmd({ cmd = "normal", args = {"o"} }, {})
    fn.cursor({line, col})
end

return M

