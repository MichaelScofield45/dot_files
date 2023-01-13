local api = vim.api

function ls_dir()
    vim.cmd([[! ls]])
end

function compile_pandoc()
    local buffer = vim.fn.expand("%")
    local filename = vim.fn.expand("%:r")
    local extension = vim.fn.expand("%:e")
    local command
    if (extension == "md") then
        if (vim.b.pandoc_command == nil or vim.b.pandoc_command == "") then
            command = string.format("pandoc %s -o %s.pdf", buffer, filename)
        else
            command = vim.b.pandoc_command
        end
		local handle = io.popen(command)
		local result = handle:read("*a")
		handle:close()
		api.nvim_echo({{"Pandoc compiling done."}}, false, {})
    else
        api.nvim_err_writeln("ERROR: Not a 'markdown' (.md) document.")
    end
end

function pandoc_command()
    vim.b.pandoc_command = vim.fn.input("My message: ")
    -- api.nvim_echo(vim.b.pandoc_command)
end

api.nvim_create_user_command("CompilePandoc", compile_pandoc, {})
api.nvim_create_user_command("SetCompileCommand", pandoc_command, {})
vim.keymap.set("n", "<leader>pd", compile_pandoc)
vim.keymap.set("n", "<leader>pc", pandoc_command)

function write_new_line_before() 
    local _, line, col, _, _ = unpack(vim.fn.getcurpos())
    api.nvim_cmd({ cmd = "normal", args = {"O"} }, {})
    vim.fn.cursor({line + 1, col})
end

function write_new_line_after() 
    local _, line, col, _, _ = unpack(vim.fn.getcurpos())
    api.nvim_cmd({ cmd = "normal", args = {"o"} }, {})
    vim.fn.cursor({line, col})
end

vim.keymap.set("n", "<leader>[", write_new_line_before)
vim.keymap.set("n", "<leader>]", write_new_line_after)
