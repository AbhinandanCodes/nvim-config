local M = {}

function M.setup(capabilities)
	vim.lsp.config("pyrefly", {
		capabilities = capabilities,
	})
	vim.lsp.config("pytest_lsp", {
		cmd = { "pytest-language-server" },
		filetypes = { "python" },
		root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "pytest.ini", ".git" },
	})

	vim.lsp.enable("pyrefly")
	vim.lsp.enable("pytest_lsp")
end

return M
