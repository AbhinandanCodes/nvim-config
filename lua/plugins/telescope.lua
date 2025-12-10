return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = { preview_width = 0.55 },
                    vertical = { mirror = true },
                },
                sorting_strategy = "ascending",
                layout_strategy = "flex",
                prompt_prefix = "🔍 ",
                selection_caret = " ",
            },
        })
    end,
}
