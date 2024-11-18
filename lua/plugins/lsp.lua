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
                },

            })

            require("mason-lspconfig").setup_handlers {
                -- Default handler
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                -- Dedicated handlers for specific servers.
                ["pyright"] = function ()
                    require("pyright").setup({
                        --
                    })
                end
            }
        end
    },
    {
        -- LSP: Language Server Protocol
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim", },
    }
}

