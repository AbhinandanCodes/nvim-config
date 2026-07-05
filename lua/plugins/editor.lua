return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"pocco81/auto-save.nvim",
		version = "*",
		event = "InsertLeave",
		config = function()
			require("auto-save").setup({
				enabled = true,
				execution_message = {
					message = function()
						return ""
					end,
					dim = 0.18,
					cleaning_interval = 1250,
				},
				trigger_events = { "BufLeave", "FocusLost", "InsertLeave", "TextChanged" },
				debounce_delay = 135,
				condition = function(buf)
					local fn = vim.fn
					return fn.getbufvar(buf, "&modifiable") == 1 and fn.empty(fn.getbufvar(buf, "&buftype")) == 1
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufReadPre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_fix", "ruff_format" },
					javascript = { "prettier" },
					typescript = { "prettier" },
				},
			})

			vim.g.auto_format_enabled = true

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					if vim.g.auto_format_enabled then
						require("conform").format({
							bufnr = args.buf,
							async = false,
							lsp_fallback = true,
						})
					end
				end,
			})
		end,
	},
	{
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
					prompt_prefix = "  ",
					selection_caret = " ",
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 15,
				start_in_insert = true,
				direction = "float",
				persist_size = true,
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				highlight = { keyword = "fg" },
				gui_style = { fg = "NONE", bg = "BOLD" },
			})
		end,
	},
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {},
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = { "lua", "python", "javascript", "typescript" },
			})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown" },
		lazy = true,
		opts = {
			preview = {
				icon_provider = "dev-icons",
			},
		},
	},
}

