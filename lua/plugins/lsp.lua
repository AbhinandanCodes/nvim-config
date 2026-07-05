return {
	{
		"Saghen/blink.cmp",
		version = "*",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "none",
					["<Tab>"] = { "select_next", "fallback" },
					["<S-Tab>"] = { "select_prev", "fallback" },

					["<CR>"] = { "accept", "fallback" },
				},
				completion = {
					documentation = { auto_show = true },
					menu = { auto_show = true },
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				cmdline = {
					keymap = {
						preset = "inherit",
						["<CR>"] = { "fallback" },
					},
					completion = { menu = { auto_show = true } },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lsp").setup(capabilities)
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyrefly",
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"ruff",
					"prettier",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
}
