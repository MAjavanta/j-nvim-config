local keymap = vim.keymap

local opts = { noremap = true, silent = true }
-- Directory Navigation
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Navigating panes
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
--Control J/K to move lines down/up in visual mode
keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "moves line down in visual selection" })
keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "moves line up in visual selection" })

--Copy whole file
keymap.set("n", "yG", "gg0yG")
--paste over text without writing deleted text to clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_dP]])
--deletes character without copying to clipboard
keymap.set("n", "x", "_x")

--Replace word under cursor globally
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
