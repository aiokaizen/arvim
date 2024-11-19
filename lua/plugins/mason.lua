return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"prettierd",
					"stylua",
					"ruff",
					"shfmt",
					"djlint",
				},
			})
		end,
	},
}
