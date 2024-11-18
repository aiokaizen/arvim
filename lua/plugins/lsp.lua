return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
            mason.setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "pyright",
                    "ruff",
                },
                handlers = {
                    -- Default handler
                    function (server_name)
                        require("lspconfig")[server_name].setup {}
                    end,

                    -- Dedicated handlers for specific servers.
                    ["pyright"] = function ()
                        local lspconfig = require("lspconfig")
                        lspconfig.pyright.setup({
                            settings = {
                                pyright = {
                                    -- Using Ruff's import organizer
                                    -- disableOrganizeImports = true,
                                },
                                python = {
                                    analysis = {
                                        -- Ignore all files for analysis to exclusively use Ruff for linting
                                        -- ignore = { '*' },
                                    }
                                }
                            }
                        })
                    end,

                    ["ruff"] = function ()
                        local lspconfig = require("lspconfig")
                        lspconfig.ruff.setup({
                            trace = 'messages',
                            init_options = {
                                settings = {
                                    configuration = "~/.config/nvim/ruff.toml",
                                    logLevel = 'debug',
                                    -- exclude = ["**/venv/**"],
                                },
                            },
                        })
                    end,

                    ["lua_ls"] = function ()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end,
                }

            })
        end
    },
    {
        -- LSP: Language Server Protocol
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim", },
    }
}

