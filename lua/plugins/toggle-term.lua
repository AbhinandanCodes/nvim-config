return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      start_in_insert = true,
      direction = "float",
      persist_size = true,
    })
  end,
}
