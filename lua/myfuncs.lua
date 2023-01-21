local api = vim.api
local fn = vim.fn

local M = {}

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

M.indent_whole_file = function()
    local _, line, col, _, _ = unpack(fn.getcurpos())
    local currentIndent = fn.shiftwidth()
    local newIndent = tonumber(fn.input(""))

    vim.bo.shiftwidth = newIndent
    api.nvim_cmd({ cmd = "normal", args = {"gg=G"} }, {})
    fn.cursor({line, col})
    vim.bo.shiftwidth = currentIndent
end

M.set_makeprg = function()
    local command = fn.input("Compilation command: ")
    vim.bo.makeprg = command
end

return M

