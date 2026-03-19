local M = {}

function M.setup(capabilities)
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
  })
end

return M