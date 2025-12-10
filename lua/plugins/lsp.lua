local capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  {
    "neovim/nvim-lspconfig",
    config = function()

      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("jdtls", { capabilities = capabilities })
      vim.lsp.config("ts_ls", { capabilities = capabilities })

      -- Inline error
      -- vim.diagnostic.config({
      --   virtual_text = true,
      -- })

      -- vim.api.nvim_create_autocmd("InsertEnter", {
      --   callback = function()
      --     vim.diagnostic.config({ virtual_text = false })
      --   end,
      -- })

      -- vim.api.nvim_create_autocmd("InsertLeave", {
      --   callback = function()
      --     vim.diagnostic.config({ virtual_text = true })
      --   end,
      -- })
      
    end,
  },
}


