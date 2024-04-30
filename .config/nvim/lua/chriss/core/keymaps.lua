-- set leader key to space
vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below with current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and keep cursor in middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and keep cursor in middle" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search result and center" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste text but keep in register" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy" })

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- buffer prev/next
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Buffer previous" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer next" })

-- page up/down
keymap.set("n", "<M-k>", "<C-u>", { desc = "Page up" }) --  move current buffer to new tab
keymap.set("n", "<M-j>", "<C-d>", { desc = "Page down" }) --  move current buffer to new tab

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>p", '"_dP', { desc = "Paste text but keep in register" })

for i = 1, 6 do
	local lhs = "<leader>" .. i
	local rhs = i .. "<c-w>w"
	keymap.set("n", lhs, rhs, { desc = "Move to window " .. i })
end

vim.cmd([[
:runtime mappings.vim
]])
