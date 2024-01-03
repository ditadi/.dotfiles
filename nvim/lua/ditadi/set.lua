vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.numberwidth = 4
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")

-- Remove the background color of the column to the left of the line numbers
vim.cmd [[highlight LineNr ctermbg=NONE guibg=NONE gui=NONE cterm=NONE]]
vim.cmd [[highlight VertSplit ctermbg=NONE guibg=NONE gui=NONE cterm=NONE]]
vim.cmd [[highlight NormalNC ctermbg=NONE guibg=NONE gui=NONE cterm=NONE]]

-- Highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd('set noshowmode')
