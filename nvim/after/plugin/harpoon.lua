local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "tt", mark.add_file)
vim.keymap.set("n", "tm", ui.toggle_quick_menu)

vim.keymap.set("n", "t1", function() ui.nav_file(1) end)
vim.keymap.set("n", "t2", function() ui.nav_file(2) end)
vim.keymap.set("n", "t3", function() ui.nav_file(3) end)
vim.keymap.set("n", "t4", function() ui.nav_file(4) end)

