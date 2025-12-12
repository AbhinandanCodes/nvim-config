local capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  {
    "neovim/nvim-lspconfig",
    config = function()

      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("jdtls", { capabilities = capabilities })
      vim.lsp.config("ts_ls", { capabilities = capabilities })
      
    end,
  },
}


