vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

vim.opt.cursorline = true

vim.opt.clipboard:append("unnamedplus")
