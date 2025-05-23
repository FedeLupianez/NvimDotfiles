-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Find filewith snacks :
keymap.set("n", "<Leader>ff", "<CMD>lua Snacks.dashboard.pick('files')<CR>", { desc = "Find file" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Delete buffer
keymap.set("n", "<C-o>", ":bdelete<CR>", { desc = "Delete buffer" })

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Delete char
-- keymap.set("n", "s", "<Del>", { noremap = true })

-- Oil plugin
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })

-- Delete all the buffers except the active
keymap.set(
	"n",
	"<leader>bq",
	'<Esc>:%bdelete|edit #|normal`"<Return>',
	{ desc = "Delete other buffers but the current one" }
)
