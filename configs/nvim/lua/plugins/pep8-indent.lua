return {
    "Vimjas/vim-python-pep8-indent",
    lazy = false,
    config = function()
        local group = vim.api.nvim_create_augroup("Pep8IndentForIpyMd", { clear = true })

        vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufEnter", "FileType" }, {
            group = group,
            pattern = { "*.ipynb", "*.ipynb.md" },
            callback = function(args)
                vim.bo[args.buf].indentexpr = "GetPythonPEPIndent(v:lnum)"
            end,
        })
    end,
}
