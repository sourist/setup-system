return {
    'jmbuhr/otter.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'neovim/nvim-lspconfig',
    },
    config = function()
        local otter = require('otter')

        otter.setup({
            lsp = {
                diagnostic_update_events = { "BufWritePost", "InsertLeave" },
            },
            buffers = {
                set_filetype = true,
            },
        })

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = { "markdown" },
            callback = function()
                local fname = vim.api.nvim_buf_get_name(0)
                if fname:match("%.ipynb") then
                    vim.schedule(function()
                        otter.activate({ "python" }, true, true)
                    end)
                end
            end,
        })
    end
}
