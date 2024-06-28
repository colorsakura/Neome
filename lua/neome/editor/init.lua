return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
		      "nvim-lua/plenary.nvim",
		      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		      "MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({toggle=true})
				end,
				desc = "Explorer NeoTree",
			},
		},
		opts = {
			window = {
				width = 24,
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
		end,
	},
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
