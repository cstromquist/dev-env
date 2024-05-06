return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>bs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>br", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>bs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<leader>br", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>bS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>bR", gs.reset_buffer, "Reset buffer")

			map("n", "<leader>bu", gs.undo_stage_hunk, "Undo stage hunk")

			map("n", "<leader>bp", gs.preview_hunk, "Preview hunk")

			map("n", "<leader>bb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>bB", gs.toggle_current_line_blame, "Toggle line blame")

			map("n", "<leader>bd", gs.diffthis, "Diff this")
			map("n", "<leader>bD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
