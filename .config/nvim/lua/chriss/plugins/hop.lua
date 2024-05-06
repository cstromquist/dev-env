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
			local directions = require("hop.hint").HintDirection
			local keymao = vim.keymap

			vim.keymap.set("n", "<leader>h1", "<cmd>HopChar1<CR>", { remap = true })
			vim.keymap.set("n", "<leader>h2", "<cmd>HopChar2<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hl", "<cmd>HopLine<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hL", "<cmd>HopLineStart<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hW", "<cmd>HopWordCurrentLine<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hm", "<cmd>HopWordMW<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hv", "<cmd>HopVertical<CR>", { remap = true })
			vim.keymap.set("n", "<leader>hp", "<cmd>HopPattern<CR>", { remap = true })
			-- vim.keymap.set("n", "<leader>hF", function()
			-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			-- end, { remap = true })
			-- vim.keymap.set("n", "<leader>ht", function()
			-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			-- end, { remap = true })
			-- vim.keymap.set("n", "<leader>hT", function()
			-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			-- end, { remap = true })
			hop.setup()

			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					hop = {
						-- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
						keys = {
							"a",
							"s",
							"d",
							"f",
							"g",
							"h",
							"j",
							"k",
							"l",
							";",
							"q",
							"w",
							"e",
							"r",
							"t",
							"y",
							"u",
							"i",
							"o",
							"p",
							"A",
							"S",
							"D",
							"F",
							"G",
							"H",
							"J",
							"K",
							"L",
							":",
							"Q",
							"W",
							"E",
							"R",
							"T",
							"Y",
							"U",
							"I",
							"O",
							"P",
						},
						-- Highlight groups to link to signs and lines; the below configuration refers to demo
						-- sign_hl typically only defines foreground to possibly be combined with line_hl
						sign_hl = { "WarningMsg", "Title" },
						-- optional, typically a table of two highlight groups that are alternated between
						line_hl = { "CursorLine", "Normal" },
						-- options specific to `hop_loop`
						-- true temporarily disables Telescope selection highlighting
						clear_selection_hl = false,
						-- highlight hopped to entry with telescope selection highlight
						-- note: mutually exclusive with `clear_selection_hl`
						trace_entry = true,
						-- jump to entry where hoop loop was started from
						reset_selection = true,
					},
				},
			})
			telescope.load_extension("hop")
		end,
	},
}
