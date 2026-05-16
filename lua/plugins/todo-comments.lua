return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("todo-comments").setup({
			highlight = {
				keyword = "fg",
			},
			colors = {
				error = { "#FF5555" },
				warning = { "#FFB86C" },
				info = { "#8BE9FD" },
				hint = { "#50FA7B" },
				default = { "#BD93F9" },
				test = { "#F1FA8C" },
			},
			gui_style = {
				fg = "NONE",
				bg = "BOLD",
			},
		})
	end,
}
