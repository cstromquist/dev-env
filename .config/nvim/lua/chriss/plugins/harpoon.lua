return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local keymap = vim.keymap

		keymap.set("n", "<M-8>", function()
			harpoon:list():add()
		end, { desc = "Add file to list" })
		keymap.set("n", "<M-7>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon quick menu" })

		keymap.set("n", "<M-1>", function()
			harpoon:list():select(1)
		end, { desc = "Select 1" })
		keymap.set("n", "<M-2>", function()
			harpoon:list():select(2)
		end, { desc = "Select 2" })
		keymap.set("n", "<M-3>", function()
			harpoon:list():select(3)
		end, { desc = "Select 3" })
		keymap.set("n", "<M-4>", function()
			harpoon:list():select(4)
		end, { desc = "Select 4" })

		-- toggle previous & next buffers stored within harpoon list
		keymap.set("n", "<M-5>", function()
			harpoon:list():prev()
		end, { desc = "" })
		keymap.set("n", "<M-6>", function()
			harpoon:list():next()
		end, { desc = "" })
	end,
}
