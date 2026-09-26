return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            current_line_blame = false,
            sign_priority = 20,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]h", gs.next_hunk, { desc = "Next Git Hunk" })
                map("n", "[h", gs.prev_hunk, { desc = "Prev Git Hunk" })

                -- Actions
                map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git Hunk" })
                map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Git Hunk" })
                map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Git Blame Line" })
                map("n", "<leader>hd", gs.diffthis, { desc = "Git Diff" })
            end,
        })
    end,
}
