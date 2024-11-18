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
                }
            })
        end
    },
    {
        -- LSP: Language Server Protocol
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim", },
        config = function ()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({ })
            lspconfig.lua_ls.setup({ })
        end
    }
}

