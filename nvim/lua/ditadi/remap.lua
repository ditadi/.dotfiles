vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- Split Screen Vertical
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w');

-- Move Line to top or to bottom
vim.keymap.set("v", "J", ":m '>+1<CR>gv=")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=")

-- Centralize to Top and to Bottom
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- No Record
vim.keymap.set("n", "Q", "<nop>")

-- New Sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Delete a word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- Centralize Screen
vim.keymap.set("n", "<leader>b", "zH")
vim.keymap.set("n", "<leader>n", "zL")

-- Quick Save and Quick Quit
vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("n", "<leader>o", "a<CR><Esc>O")
vim.api.nvim_set_keymap('n', 'ff', [[:silent !tmux neww tmux-sessionizer<CR>]], { noremap = true, silent = true })

vim.api.nvim_exec([[
  function! SetFileTypeMapping()
    if &filetype ==# 'go'
      nnoremap <buffer> <leader>ff :GoImport<CR>:silent :GoFmt<CR>
    else
    nnoremap <buffer> <leader>ff :Prettier<CR>

    endif
  endfunction

  augroup FileTypeAutoCommands
    autocmd!
    autocmd FileType * call SetFileTypeMapping()
  augroup END
]], false)
