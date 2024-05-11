return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
	{
		"nvim-telescope/telescope-hop.nvim",
		config = function()
			-- place this in one of your configuration file(s)
			local hop = require("hop")
			local keymap = vim.keymap

			keymap.set("n", "<leader>h1", "<cmd>HopChar1<CR>", { remap = true })
			keymap.set("n", "<leader>h2", "<cmd>HopChar2<CR>", { remap = true })
			keymap.set("n", "<leader>hl", "<cmd>HopLine<CR>", { remap = true })
			keymap.set("n", "<leader>hL", "<cmd>HopLineStart<CR>", { remap = true })
			keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { remap = true })
			keymap.set("n", "<leader>hW", "<cmd>HopWordCurrentLine<CR>", { remap = true })
			keymap.set("n", "<leader>hm", "<cmd>HopWordMW<CR>", { remap = true })
			keymap.set("n", "<leader>hv", "<cmd>HopVertical<CR>", { remap = true })
			keymap.set("n", "<leader>hp", "<cmd>HopPattern<CR>", { remap = true })
			hop.setup()
		end,
	},
}
