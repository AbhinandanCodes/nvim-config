vim.api.nvim_create_user_command("PytestLspStart", function()
	require("lsp.python_test").start_pytest_lsp()
end, {})

vim.api.nvim_create_user_command("PytestLspStop", function()
	require("lsp.python_test").stop_pytest_lsp()
end, {})

vim.api.nvim_create_user_command("PytestLspToggle", function()
	require("lsp.python_test").toggle_pytest_lsp()
end, {})