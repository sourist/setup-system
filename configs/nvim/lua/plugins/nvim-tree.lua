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
                dotfiles = false,
            },
        })

        -- Hotkeys
        vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<CR>', { silent = true, desc = 'Toggle File Tree' })
    end,
}
