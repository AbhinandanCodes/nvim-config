return {
	{
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("lsp").setup(capabilities)
	end,
	}
}
