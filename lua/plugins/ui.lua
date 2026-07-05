return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠞⢳⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠋⠀⢰⠎⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢆⣤⡞⠃⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢠⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⢀⣀⣾⢳⠀⠀⠀⠀⢸⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣀⡤⠴⠊⠉⠀⠀⠈⠳⡀⠀⠀⠘⢎⠢⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀",
				"⠳⣄⠀⠀⡠⡤⡀⠀⠘⣇⡀⠀⠀⠀⠉⠓⠒⠺⠭⢵⣦⡀⠀⠀⠀",
				"⠀⢹⡆⠀⢷⡇⠁⠀⠀⣸⠇⠀⠀⠀⠀⠀⢠⢤⠀⠀⠘⢷⣆⡀⠀",
				"⠀⠀⠘⠒⢤⡄⠖⢾⣭⣤⣄⠀⡔⢢⠀⡀⠎⣸⠀⠀⠀⠀⠹⣿⡀",
				"⠀⠀⢀⡤⠜⠃⠀⠀⠘⠛⣿⢸⠀⡼⢠⠃⣤⡟⠀⠀⠀⠀⠀⣿⡇",
				"⠀⠀⠸⠶⠖⢏⠀⠀⢀⡤⠤⠇⣴⠏⡾⢱⡏⠁⠀⠀⠀⠀⢠⣿⠃",
				"⠀⠀⠀⠀⠀⠈⣇⡀⠿⠀⠀⠀⡽⣰⢶⡼⠇⠀⠀⠀⠀⣠⣿⠟⠀",
				"⠀⠀⠀⠀⠀⠀⠈⠳⢤⣀⡶⠤⣷⣅⡀⠀⠀⠀⣀⡠⢔⠕⠁⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠫⠿⠿⠿⠛⠋⠁⠀⠀⠀⠀",
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}

			dashboard.section.footer.val = "Welcome back Panda <3"

			alpha.setup(dashboard.opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function venv()
				local path = os.getenv("VIRTUAL_ENV")
				return path and (" " .. vim.fn.fnamemodify(path, ":t")) or ""
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					icons_enabled = true,
				},
				sections = {
					lualine_c = {
						"filename",
						{
							venv,
							cond = function()
								return vim.bo.filetype == "python"
							end,
							color = { fg = "#50FA7B", gui = "bold" },
						},
					},
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				enable_git_status = true,
				enable_diagnostics = true,
				filesystem = {
					follow_current_file = { enabled = true },
					hijack_netrw_behavior = "open_current",
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			cmdline = { view = "cmdline_popup" },
			views = {
				cmdline_popup = {
					position = {
						row = "30%",
						col = "50%",
					},
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themeConfigFile = "c:\\v:null",
				themes = { "dracula", "catppuccin-mocha" },
				globalAfter = [[
local api = vim.api

api.nvim_set_hl(0, "NoiceCmdline", { link = "NormalFloat" })
api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
api.nvim_set_hl(0, "NoiceConfirmBorder", { link = "FloatBorder" })
]],
			})
		end,
	},
	{
		"mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				transparent_bg = true,
				italic_comment = false,
			})
		end,
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				custom_highlights = function(colors)
					return {
						StatusLine = { bg = colors.mantle },
						StatusLineNC = { bg = colors.mantle },
						lualine_a_normal = { bg = colors.blue, fg = colors.base },
						lualine_b_normal = { bg = colors.surface0, fg = colors.text },
						lualine_c_normal = { bg = colors.mantle, fg = colors.text },
						BlinkCmpMenu = { bg = colors.mantle },
						BlinkCmpMenuBorder = { bg = colors.mantle, fg = colors.surface2 },
						BlinkCmpDoc = { bg = colors.mantle },
						BlinkCmpDocBorder = { bg = colors.mantle, fg = colors.surface2 },
						BlinkCmpMenuSelection = { bg = colors.surface0, fg = colors.text },
						BlinkCmpScrollBarThumb = { bg = colors.surface2 },
						BlinkCmpScrollBarGutter = { bg = colors.mantle },
					}
				end,
			})
		end,
	},
}

