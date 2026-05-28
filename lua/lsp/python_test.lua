local M = {}

function M.setup(capabilities)
	vim.lsp.config("pytest_lsp", {
		cmd = { "pytest-language-server" },
		filetypes = { "python" },
		root_markers = {
			"pytest.ini",
			"pyproject.toml",
			"setup.cfg",
			".git",
		},
	})
end

-- ===== pytest LSP manual control =====

local function get_root()
	return vim.fs.root(0, {
		"pytest.ini",
		"pyproject.toml",
		"setup.cfg",
		".git",
	})
end

function M.start_pytest_lsp()
	local root = get_root()
	if not root then
		vim.notify("No pytest project root found", vim.log.levels.WARN)
		return
	end

	vim.lsp.start({
		name = "pytest_lsp",
		cmd = { "pytest-language-server" },
		root_dir = root,
		filetypes = { "python" },
	})

	vim.notify("pytest_lsp started")
end

function M.stop_pytest_lsp()
	for _, client in pairs(vim.lsp.get_clients()) do
		if client.name == "pytest_lsp" then
			client.stop()
			vim.notify("pytest_lsp stopped")
		end
	end
end

function M.toggle_pytest_lsp()
	local clients = vim.lsp.get_clients()
	for _, client in pairs(clients) do
		if client.name == "pytest_lsp" then
			client.stop()
			vim.notify("pytest_lsp stopped")
			return
		end
	end

	M.start_pytest_lsp()
end

return M
