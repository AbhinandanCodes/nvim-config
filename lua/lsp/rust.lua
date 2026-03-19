local M = {}

function M.setup(capabilities)
	vim.lsp.config("rust_analyzer", {
		capabilities = capabilities,
	})

	vim.lsp.enable("rust_analyzer")
end

return M
