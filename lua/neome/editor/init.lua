return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "AstroNvim/astrolsp", opts = {} },
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = { "williamboman/mason.nvim" },
				opts = function()
					return {
						handlers = { function(server) require("astrolsp").lsp_setup(server) end }
					}
				end,
			},
		},
		config = function()
			vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
}
