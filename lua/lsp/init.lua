local M = {}

function M.setup(capabilities)
	require("lsp.lua").setup(capabilities)
	require("lsp.python").setup(capabilities)
	require("lsp.typescript").setup(capabilities)
	require("lsp.java").setup(capabilities)
	require("lsp.rust").setup(capabilities)
	require("lsp.web").setup(capabilities)
	require("lsp.clang").setup(capabilities)
end

return M

