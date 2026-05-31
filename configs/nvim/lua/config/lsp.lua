vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }

        -- Go to definition
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        -- Show description
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- Rename in all project
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- References
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- Show error
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    end,
})

-- Pyright
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("basedpyright", {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python", "ipynb"},
    root_markers = { ".git", "pyproject.toml" },
    capabilities = capabilities,
})

vim.lsp.enable("basedpyright")
