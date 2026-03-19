local M = {}

function M.setup(capabilities)
	local servers = { "html", "cssls", "jsonls" }

	for _, server in ipairs(servers) do
		vim.lsp.config(server, {
			capabilities = capabilities,
		})

		vim.lsp.enable(server)
	end
end

return M
