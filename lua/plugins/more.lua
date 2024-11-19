return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("nvim-tree").setup({
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
					git_ignored = false,
					custom = {
						".git",
						"venv",
						"__pycache__",
					},
				},
				git = {
					enable = true,
					show_on_dirs = true,
					show_on_open_dirs = true,
					disable_for_dirs = {},
					timeout = 400,
					cygwin_support = false,
				},
			})

			local api = require("nvim-tree.api")
			-- custom mappings
			vim.keymap.set("n", "<C-n>", api.tree.toggle, { desc = "nvim-tree: Toggle" })
			vim.keymap.set("n", "?", api.tree.toggle_help, { desc = "nvim-tree: Help" })
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					indicator = {
						icon = "",
						style = "icon",
					},
					tab_size = 20,
					max_name_length = 20,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			npairs.setup({
				check_ts = true, -- Enable treesitter integration if installed
			})

			-- Custom rules for Django templates
			npairs.add_rules({
				-- Add {% and %} pair
				Rule("{%", " %", "htmldjango"):with_pair(function() end),
				-- Add {# and #} pair
				Rule("{#", " #", "htmldjango"),
				-- Add {{ and }} pair (We only used one closing `}` because a default rule already closes it by default.)
				Rule("{{", " }", "htmldjango"),
			})
		end,
	},
	{
		"elentok/format-on-save.nvim",
		dependancies = {
			"rcarriga/nvim-notify",
		},
		config = function()
			local format_on_save = require("format-on-save")
			local vim_notify = require("format-on-save.error-notifiers.vim-notify")
			local formatters = require("format-on-save.formatters")

			format_on_save.setup({
				exclude_path_patterns = {
					"/node_modules/",
					"/venv/",
				},

				formatter_by_ft = {
					python = formatters.ruff,
					django = formatters.djlint,
					jinja = formatters.djlint,
					css = formatters.prettierd,
					html = formatters.prettierd,
					javascript = formatters.prettierd,
					json = formatters.prettierd,
					lua = formatters.stylua,
					markdown = formatters.prettierd,
					scss = formatters.prettierd,
					sh = formatters.shfmt,
					typescript = formatters.prettierd,
					typescriptreact = formatters.prettierd,
					yaml = formatters.lsp,

					-- Add your own shell formatters:
					-- myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

					-- Concatenate formatters
					-- python = {
					--     formatters.remove_trailing_whitespace,
					--     formatters.shell({ cmd = "tidy-imports" }),
					--     formatters.black,
					--     formatters.ruff,
					-- },
				},
				error_notifier = vim_notify,
			})
		end,
	},
	{
		"anuvyklack/pretty-fold.nvim",
		event = "BufWinEnter", -- Load on entering a buffer
		config = function()
			require("pretty-fold").setup({
				sections = {
					left = {
						"", -- Add the plus/minus sign dynamically
						"content",
					},
				},
				fill_char = " ",
				open_fold_icon = "-", -- The minus sign for open folds
				close_fold_icon = "+", -- The plus sign for closed folds
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "BufWinEnter", -- Load on entering a buffer
		config = function()
			require("neoscroll").setup({
				hide_cursor = false,
			})
		end,
	},
	-- {
	--   "nvimtools/none-ls.nvim",
	--   ft = { "python" },
	--   opts = function()
	--     return require "custom.configs.null-ls"
	--   end,
	-- },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
