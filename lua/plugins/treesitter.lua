return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch= "master",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            ensure_installed = { "lua", "python", "java", "javascript" }
        })
    end
}
