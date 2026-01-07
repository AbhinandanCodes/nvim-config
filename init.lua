-- Load core settings
require("core.options")
require("core.keymaps")

-- Load lazy.nvim bootstrap + plugin setup
require("core.lazy")

--clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
--diagonistics

vim.diagnostic.config({
	update_in_insert = true,
	underline = true,
	virtual_text = true,
})

