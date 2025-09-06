-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- The fkin way to swap these keybinds
local group = vim.api.nvim_create_augroup("CoredusKLspKeymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function()
    local Keys = require("lazyvim.plugins.lsp.keymaps").get()

    Keys[#Keys + 1] = {
      "<leader>ss",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
      has = "documentSymbol",
    }

    Keys[#Keys + 1] = {
      "<leader>sS",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
      has = "workspace/symbols",
    }
  end,
})
