vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
vim.keymap.set('n', '<Space>', '<C-w>w')

-- Remove Recording Feature
vim.keymap.set('n', 'q', "<Nop>")

-- Delete a word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- Move Backwards with Q and Forward with E
vim.keymap.set('n', 'q', 'b')

-- Fast Go to Initial and Final Line
vim.keymap.set('n', 'G', '^')
vim.keymap.set('n', 'L', '$')

-- Move between container
vim.keymap.set('n', 'm', '%');



