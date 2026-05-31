return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("kanagawa").setup({
            compile = true,
            undercurl = true,
            dimInactive = false,
            theme = "dragon",
            background = {
                dark = "dragon",
                light = "lotus"
            },
        })

        vim.cmd("colorscheme kanagawa")
    end,
}
