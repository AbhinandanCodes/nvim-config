local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.undofile = true

vim.diagnostic.config({
	update_in_insert = true,
	underline = true,
	virtual_text = true,
})
