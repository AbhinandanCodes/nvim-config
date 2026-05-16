vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { silent = true }

-- ======================
-- Telescope
-- ======================
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- ======================
-- Neo-tree
-- ======================
map("n", "<leader>e", ":Neotree toggle<CR>", opts)
map("n", "<leader>o", ":Neotree focus<CR>", opts)

-- ======================
-- LSP
-- ======================
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- Manual format
map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- ======================
-- ToggleTerm
-- ======================
map("n", "<leader>h", "<cmd>ToggleTerm size=15 direction=horizontal<CR>", opts)
map("n", "<leader>v", "<cmd>ToggleTerm size=80 direction=vertical<CR>", opts)
map("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", opts)
map("t", "<esc>", [[<C-\><C-n>]], opts)

-- ======================
-- Auto-save toggle
-- ======================
local autosave_enabled = true
map("n", "<leader>as", function()
	local autosave = require("auto-save")
	autosave.toggle()
	autosave_enabled = not autosave_enabled
	if autosave_enabled then
		vim.notify("Auto-save enabled", vim.log.levels.INFO)
	else
		vim.notify("Auto-save disabled", vim.log.levels.WARN)
	end
end, opts)

-- ======================
-- Auto-format toggle
-- ======================
map("n", "<leader>af", function()
	vim.g.auto_format_enabled = not vim.g.auto_format_enabled
	if vim.g.auto_format_enabled then
		vim.notify("Auto-format enabled", vim.log.levels.INFO)
	else
		vim.notify("Auto-format disabled", vim.log.levels.WARN)
	end
end, opts)

-- ======================
-- Buffer navigation
-- ======================
map("n", "<Tab>", "<cmd>bn<CR>", opts)
map("n", "<S-Tab>", "<cmd>bp<CR>", opts)
map("n", "<leader>bd", "<cmd>bd<CR>", opts)

-- ======================
-- Quick saving
-- ======================
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("i", "<C-s>", "<Esc><cmd>w<CR>a", opts)

-- ======================
-- Delete without yanking
-- ======================
map("n", "D", '"_D', opts)
map("v", "D", '"_d', opts)

-- ======================
-- Window navigation
-- ======================
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- ======================
-- Diagnostics
-- ======================
map("n", "gl", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>dd", "<cmd>Trouble diagnostics toggle<CR>", opts)

-- ======================
-- Move lines up/down
-- ======================
map("n", "<A-j>", "<cmd>m .+1<CR>:w<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>:w<CR>==", opts)

map("v", "<A-j>", ":m '>+1<CR>gv=gv:w<CR>", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv:w<CR>", opts)

map("i", "<A-j>", "<Esc><cmd>m .+1<CR>:w<CR>==gi", opts)
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>:w<CR>==gi", opts)

-- ======================
-- Mark-Preview
-- ======================
map("n", "<leader>md", ":Markview splitToggle<CR>", opts)

-- ======================
-- Todo Comments
-- ======================

local function toggle_trouble_todos()
	local trouble = require("trouble")
	if trouble.is_open() then
		trouble.close()
	else
		vim.cmd("TodoTrouble")
	end
end

local function toggle_loclist()
	local qf_open = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.loclist == 1 then
			qf_open = true
			vim.cmd("lclose")
			return
		end
	end
	vim.cmd("TodoLocList")
end

local function toggle_quickfix()
	local qf_open = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_open = true
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("TodoQuickFix")
end

map("n", "]x", function()
	require("todo-comments").jump_next()
end, opts)

map("n", "[x", function()
	require("todo-comments").jump_prev()
end, opts)

map("n", "<leader>xd", toggle_trouble_todos, opts)
map("n", "<leader>xl", toggle_loclist, opts)
map("n", "<leader>xq", toggle_quickfix, opts)

map("n", "<leader>xt", "<cmd>TodoTelescope<CR>", opts)
