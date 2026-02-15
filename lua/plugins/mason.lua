return {
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
					-- LSP
					"lua_ls",
					"clangd",
					"pyright",
					"jdtls",
					"rust_analyzer",
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
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
					-- Formatter
					"stylua",
					"clang-format",
					"black",
					"google-java-format",
					"rustfmt",
					"prettier",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
}
