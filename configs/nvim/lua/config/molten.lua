vim.g.molten_image_provider = "image.nvim"
vim.g.molten_output_win_max_height = 30
vim.g.molten_virt_text_output = true
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_auto_open_output = false
vim.g.molten_image_location = "virt"
vim.g.molten_output_virt_lines = true
vim.g.molten_wrap_output = true
vim.g.molten_virt_text_max_lines = 20

vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "Hide output window" })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "Evaluate visual selection" })
vim.keymap.set("n", "<localleader>io", ":MoltenImportOutput<CR>", { silent = true, desc = "Import output" })


-- Keymap to select python blocks in ipynb files
vim.keymap.set('n', '<localleader>x', function()
    -- Search backward for the start of the block
    local start_line = vim.fn.search('^```python\\s*$', 'bcnW')
    -- Search forward for the end of the block
    local end_line = vim.fn.search('^```\\s*$', 'cnW')

    if start_line > 0 and end_line > start_line then
        vim.api.nvim_win_set_cursor(0, { start_line + 1, 0 })

        vim.cmd("MoltenDelete")

        vim.cmd('normal! V')
        vim.api.nvim_win_set_cursor(0, { end_line - 1, 0 })

        local keys = vim.api.nvim_replace_termcodes(":<C-u>MoltenEvaluateVisual<CR>", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
    else
        print 'No Python code block found.'
    end
end, { desc = 'Run Python code block' })


-- Export output
local molten_group = vim.api.nvim_create_augroup("MoltenAutomation", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = molten_group,
    pattern = { "*.ipynb" },
    callback = function()
        local ok, molten_status = pcall(require, "molten.status")
        if not ok then
            return
        end

        if molten_status.initialized() == "" then
            return
        end

        pcall(vim.cmd, "silent! MoltenExportOutput!")
    end,
})
