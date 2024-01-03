return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope-file-browser.nvim'
    },
    config = function() 
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local fb_actions = telescope.extensions.file_browser.actions

        local function telescope_buffer_dir()
            return vim.fn.expand('%:p:h')
        end

        telescope.load_extension("file_browser")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>pb", function()
            telescope.extensions.file_browser.file_browser({
                path = "%:p:h",
                cwd = telescope_buffer_dir(),
                respect_gitignore = true,
                hidden = true,
                grouped = true,
                initial_mode = "normal",
                layout_config = { height = 20 }
            })
        end)
        telescope.setup({
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    hijack_netrw = true,
                    mappings = {
                        ["n"] = {
                            -- your custom normal mode mappings
                            ["l"] = require('telescope.actions').select_default,
                            ["N"] = fb_actions.create,
                            ["h"] = fb_actions.goto_parent_dir,
                            ["o"] = fb_actions.open,
                            ["/"] = function()
                                vim.cmd('startinsert')
                            end
                        },
                    }
                }
            }
        })
    end
}
