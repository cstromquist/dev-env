return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		-- your config goes here
		-- or just leave it empty :)
	},
	config = function()
		local auto_save = require("auto-save")
		auto_save.setup({
			condition = function(buf)
				if vim.bo[buf].filetype == "harpoon" then
					return false
				end
				return true
			end,
		})
	end,
}
