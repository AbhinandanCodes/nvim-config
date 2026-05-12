return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local function venv()
			local path = os.getenv("VIRTUAL_ENV")
			return path and (" " .. vim.fn.fnamemodify(path, ":t")) or ""
		end

		require("lualine").setup({
			options = {
				theme = "dracula",
				icons_enabled = true,
			},

			sections = {
				lualine_c = {
					"filename",
					{
						venv,
						cond = function()
							return vim.bo.filetype == "python"
						end,
						color = { fg = "#50FA7B", gui = "bold" },
					},
				},
			},
		})
	end,
}
