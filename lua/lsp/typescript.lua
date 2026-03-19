local M = {}

function M.setup(capabilities)
  vim.lsp.config("ts_ls", {
    capabilities = capabilities,
  })
end

return M