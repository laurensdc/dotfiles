-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n" }, "<c-t>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Toggle Terminal (Root Dir)" })

vim.keymap.set("t", "<c-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>", { desc = "Escape Terminal mode" })
