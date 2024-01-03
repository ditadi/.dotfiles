return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "typescript", "rust", "elixir", "html", "css" },
            sync_install = false,
            auto_install = true,
            autotag = {
                enable = true
            },
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
