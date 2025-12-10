return {
  {
    "Saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "none",
          ["<Down>"] = { "select_next", "fallback" },
          ["<Up>"] = { "select_prev", "fallback" },

          -- ["<Tab>"] = { "select_next", "fallback" },
          -- ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
        },

        completion = {
          documentation = { auto_show = true },
          menu = { auto_show = true },
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
      })
    end,
  },
}
