local M = {}

M.setup = function(capabilities)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      local jdtls = require("jdtls")

      local root_dir = require("jdtls.setup").find_root({
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
      })

      local config = {
        cmd = { "jdtls" },
        root_dir = root_dir,
        capabilities = capabilities,
      }

      jdtls.start_or_attach(config)
    end,
  })
end

return M