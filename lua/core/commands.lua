vim.api.nvim_create_user_command("PytestLspStart", function()
	require("lsp.python_test").start_pytest_lsp()
end, {})

vim.api.nvim_create_user_command("PytestLspStop", function()
	require("lsp.python_test").stop_pytest_lsp()
end, {})

vim.api.nvim_create_user_command("PytestLspToggle", function()
	require("lsp.python_test").toggle_pytest_lsp()
end, {})

vim.api.nvim_create_user_command("Venv", function()
	local path = os.getenv("VIRTUAL_ENV")
	if path then
		local venv_name = vim.fn.fnamemodify(path, ":t")
		vim.notify("󱔎 Active Venv: " .. venv_name, vim.log.levels.INFO)
	else
		vim.notify("No active virtual environment found", vim.log.levels.WARN)
	end
end, {})

