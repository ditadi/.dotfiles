return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function() 
        require("lualine").setup({
            options = { 
                theme = 'dracula',
                globalstatus = false,
            },
            extensions = {'mason'},
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filetype', 'filename'},
                lualine_x = {'progress'},
                lualine_y = {'location'},
            },
        })
    end
}
