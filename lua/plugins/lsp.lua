return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
				},
				handlers = {
					-- Default handler
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					-- Dedicated handlers for specific servers.
					["pyright"] = function()
						local lspconfig = require("lspconfig")

						lspconfig.pyright.setup({
							settings = {
								pyright = {
									-- disableOrganizeImports = true,
								},
								python = {
									analysis = {
										-- Ignore all files for analysis to exclusively use Ruff for linting
										ignore = { "*" },
										autoImportCompletions = true, -- Enable auto-import completions
									},
								},
							},
							on_attach = function(client, bufnr)
								-- Enable completion triggered by <C-x><C-o>
								vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

								-- Key mappings
								local opts = { noremap = true, silent = true }
								vim.api.nvim_buf_set_keymap(
									bufnr,
									"n",
									"gd",
									"<Cmd>lua vim.lsp.buf.definition()<CR>",
									opts
								)
								vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
							end,
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,

					["ruff"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.ruff.setup({
							trace = "messages",
							init_options = {
								settings = {
									configuration = "~/.config/nvim/ruff.toml",
									logLevel = "debug",
									-- exclude = ["**/venv/**"],
								},
							},
						})

						-- Enable organize imports for ruff on save
						vim.api.nvim_create_autocmd("BufWritePre", {
							pattern = "*.py",
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
						vim.api.nvim_set_keymap(
							"n",
							"<leader>oi",
							":lua vim.lsp.buf.format({ async = false })<CR>",
							{ noremap = true, silent = true, desc = "Organize imports using ruff" }
						)
					end,

					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		-- LSP: Language Server Protocol
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
}
