return {
  "pocco81/auto-save.nvim",
  version = "*",
  event = "InsertLeave",
  config = function()
    require("auto-save").setup({
      enabled = true,  -- or false if you want to start disabled
      execution_message = {
        message = function()
          return "Auto-saved at " .. vim.fn.strftime("%H:%M:%S")
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "BufLeave", "FocusLost", "InsertLeave", "TextChanged" },
      debounce_delay = 135,
      condition = function(buf)
        local fn = vim.fn
        return fn.getbufvar(buf, "&modifiable") == 1
          and fn.empty(fn.getbufvar(buf, "&buftype")) == 1
      end,
    })
  end,
}
