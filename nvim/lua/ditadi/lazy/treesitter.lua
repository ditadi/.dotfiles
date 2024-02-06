return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        ---@diagnostic disable-next-line: missing-fields
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "typescript", "rust", "elixir", "html", "css" },
            sync_install = false,
            auto_install = true,
            autotag = {
                enable = true
            },
            highlight = { enable = true },
            indent = { enable = true },
            additional_vim_regex_highlighting = false,
        })
    end
}
