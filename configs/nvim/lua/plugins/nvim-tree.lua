return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
                -- relativenumber = true, -- если любишь относительные номера строк
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        git = true,
                        file = true,
                        folder = true,
                    },
                },
            },
            filters = {
                dotfiles = false, -- показывать или скрывать скрытые файлы
            },
        })

        -- Hotkeys
        vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<CR>', { silent = true, desc = 'Toggle File Tree' })
    end,
}
