-- NOTE: This is just illustration - there is no need to copy/paste the
-- defaults, or call `setup` at all, if you do not want to change anything.

vim.api.nvim_set_keymap('n', '<leader>j', '<Plug>Lightspeed_s', {})
vim.api.nvim_set_keymap('n', '<leader>k', '<Plug>Lightspeed_S', {})

require'lightspeed'.setup{}
