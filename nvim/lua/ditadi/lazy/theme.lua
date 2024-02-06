return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
        require('rose-pine').setup{}
        vim.cmd.colorscheme "rose-pine"
    end
}

-- return {
--     "ellisonleao/gruvbox.nvim", 
--     priority = 1000, 
--     config = function ()
--         vim.o.background = "dark"
--         vim.cmd [[colorscheme gruvbox]]
--     end
-- }
