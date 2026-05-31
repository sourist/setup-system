return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "python", "markdown", "markdown_inline" },
        highlight = {
            enable = true,
        },
          indent = {
            enable = true,
            disable = { "python" },
          },
    }
}
