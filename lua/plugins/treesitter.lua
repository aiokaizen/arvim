local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html",
                "python", "css", "dockerfile", "git_config", "git_rebase", "gitattributes",
                "gitcommit", "gitignore", "go", "helm", "json", "regex", "requirements", "rst",
                "scss", "sql", "ssh_config", "tmux", "toml", "typescript", "xml", "yaml",
                "markdown", "markdown_inline",
            },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }

 return treesitter
