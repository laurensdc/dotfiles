-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- Fix window navigation in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = true, desc = "Go to Left Window" })
    vim.keymap.set("n", "<C-j>", "<C-w>j", { buffer = true, desc = "Go to Lower Window" })
    vim.keymap.set("n", "<C-k>", "<C-w>k", { buffer = true, desc = "Go to Upper Window" })
    vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true, desc = "Go to Right Window" })
    --
    -- Map 'ctrl+r' to refresh instead of default <C-l>
    vim.keymap.set("n", "<C-r>", "<Plug>NetrwRefresh", { buffer = true })
  end,
})

-- Stop creating NetrwTreeListing files when netrw marked buffer as "modified"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.modifiable = false
    vim.opt_local.buftype = "nowrite"
    vim.opt_local.bufhidden = "delete"
    vim.g.netrw_dirhistmax = 0
  end,
})
