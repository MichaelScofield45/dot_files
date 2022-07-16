function say_hello()
    vim.cmd([[echo "Hello"]])
end

function comp_latex()
    local buffer = vim.fn.expand("%:r")
    print(vim.inspect(buffer))
end
