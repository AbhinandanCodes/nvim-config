local M = {}

function M.setup(capabilities)
  require("lsp.lua").setup(capabilities)
  require("lsp.python").setup(capabilities)
  require("lsp.typescript").setup(capabilities)
  require("lsp.web").setup(capabilities)
  require("lsp.python_test").setup()
end

return M