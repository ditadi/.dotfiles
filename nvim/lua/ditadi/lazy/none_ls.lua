return {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
        local nls = require("null-ls").builtins
        opts.sources = vim.list_extend(opts.sources or {}, {
            nls.formatting.biome,
        })
        local status, prettier = pcall(require, "prettier")
        if (not status) then return end

        prettier.setup {
            bin = 'prettierd',
            filetypes = {
                "css",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "json",
                "scss",
                "less"
            }
        }
    end,
}
