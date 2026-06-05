local M = {}

function M.setup(capabilities)
	vim.lsp.config("pyrefly", {
		capabilities = capabilities,
	})

	vim.lsp.enable("pyrefly")
end

return M