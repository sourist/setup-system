return {
    "3rd/image.nvim",
    opts = {
        backend = "kitty",
        processor = "magick_rock",
        tmux_autocmd = true,

        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "python", "ipynb" },
            },
        },

        window_overlap_clear_enabled = true,
        editor_only_render_when_focused = true, 

        max_width = 140,
        max_height = 18,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
    }
}
