return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local keymap = vim.keymap

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add file to list" })
		keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon quick menu" })

		keymap.set("n", "<leader>hj", function()
			harpoon:list():select(1)
		end, { desc = "Select 1" })
		keymap.set("n", "<leader>hk", function()
			harpoon:list():select(2)
		end, { desc = "Select 2" })
		keymap.set("n", "<leader>hl", function()
			harpoon:list():select(3)
		end, { desc = "Select 3" })
		keymap.set("n", "<leader>h;", function()
			harpoon:list():select(4)
		end, { desc = "Select 4" })

		-- toggle previous & next buffers stored within harpoon list
		keymap.set("n", "<C-s-p>", function()
			harpoon:list():prev()
		end, { desc = "" })
		keymap.set("n", "<C-s-n>", function()
			harpoon:list():next()
		end, { desc = "" })
	end,
}
