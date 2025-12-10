local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("jdtls", { capabilities = capabilities })
      vim.lsp.config("ts_ls", { capabilities = capabilities })
      
    end,
  },
}
