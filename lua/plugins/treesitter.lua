return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },

			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"rust",
				"python",
				"java",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"jsonc",
			},
		})
	end,
}
