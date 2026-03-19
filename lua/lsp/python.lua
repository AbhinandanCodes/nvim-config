local M = {}

function M.setup(capabilities)
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "openFilesOnly",
          typeCheckingMode = "basic",
        },
      },
    },
  })

  vim.lsp.enable("pyright")
end

return M