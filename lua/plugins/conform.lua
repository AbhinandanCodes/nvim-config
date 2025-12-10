return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        java = { "google-java-format" },
      },
    })

    -- Global flag to track auto-formatting state
    vim.g.auto_format_enabled = true

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        if vim.g.auto_format_enabled then
          require("conform").format({
            bufnr = args.buf,
            async = false,
            lsp_fallback = true,
          })
        end
      end,
    })
  end,
}
