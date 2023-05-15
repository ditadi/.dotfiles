local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	on_attach = function()
		local api = require("nvim-tree.api");
		vim.keymap.set("n", "nv", api.tree.open)
		vim.keymap.set("n", "nc", api.tree.close)
		vim.keymap.set("n", "nh", api.node.navigate.parent_close)
		vim.keymap.set("n", "nl", api.node.open.edit)
	end
});




