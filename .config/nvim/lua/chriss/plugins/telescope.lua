return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function(ctx)
				vim.api.nvim_buf_call(ctx.buf, function()
					vim.fn.matchadd("TelescopeParent", "\t\t.*$")
					vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
				end)
			end,
		})

		local function filenameFirst(_, path)
			local tail = vim.fs.basename(path)
			local parent = vim.fs.dirname(path)
			if parent == "." then
				return tail
			end
			return string.format("%s\t\t%s", tail, parent)
		end

		telescope.setup({
			defaults = {
				-- path_display = { "smart" },
				-- path_display = function(opts, path)
				-- 	local tail = require("telescope.utils").path_tail(path)
				-- 	return string.format("%s (%s)", tail, path)
				-- end,
				-- Format path as "file.txt (path\to\file\)"
				-- path_display = function(opts, path)
				-- 	local tail = require("telescope.utils").path_tail(path)
				-- 	return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
				-- end,
				path_display = filenameFirst,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<c-f>"] = actions.preview_scrolling_down,
						["<c-b>"] = actions.preview_scrolling_up,
						["<c-p>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
			},
			pickers = {
				find_files = {
					path_display = filenameFirst,
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set(
			"n",
			"<leader>fs",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Find string with args" }
		)
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			{ desc = "Find string under cursor in current buffers" }
		)
	end,
}
