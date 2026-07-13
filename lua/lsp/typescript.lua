local M = {}

function M.setup(capabilities)
	local npm_root = vim.fn.system("npm root -g"):gsub("%s+", "")
	local global_ts_path = npm_root .. "/typescript/lib"

	vim.lsp.config("ts_ls", {
		capabilities = capabilities,
		init_options = {
			tsserver = {
				path = global_ts_path,
			},
		},
	})

	vim.lsp.enable("ts_ls")
end

return M

