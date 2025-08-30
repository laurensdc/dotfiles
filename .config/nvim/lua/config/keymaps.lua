-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n" }, "<c-t>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Toggle Terminal (Root Dir)" })

vim.keymap.set("t", "<c-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>", { desc = "Escape Terminal mode" })

vim.keymap.set({ "i", "t" }, "<c-bs>", "<c-w>", { desc = "Delete word back" })
vim.keymap.set({ "i", "t" }, "<m-bs>", "<c-w>", { desc = "Delete word back" })

vim.keymap.set({ "i", "c" }, "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<D-v>", "p", { desc = "Paste from system clipboard" })
vim.keymap.set("t", "<D-v>", '<c-\\><c-n>"+pi', { desc = "Paste from system clipboard" })
