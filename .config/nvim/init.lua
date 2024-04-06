-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Persistent undo through file close
vim.opt.undofile = true

-- share system clipboard for yank & paste
-- need xclip on Linux
vim.opt.clipboard = "unnamedplus"

-- ignore case in search
-- :noh to remove the highlights
vim.opt.ignorecase = true

-- modern vim only
vim.opt.compatible = false

-- syntax sugar plz
vim.opt.syntax = 'on'

-- 2 spaces for tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- zz after page scrolls
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<C-f>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<C-b>zz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })


-- Composite escape - not necessary as we're using the better_escape plugin
-- vim.api.nvim_set_keymap('i', 'jl', '<esc>', { noremap = true })

-- D when text is selected won't send text to paste register
vim.api.nvim_set_keymap('v', 'D', '"_d', { noremap = true})

-- Leader key is space, set this
-- before loading any plugins that use it 
vim.g.mapleader = " "

-- Install lazy.vim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
  "ThePrimeagen/vim-be-good",
  "sheerun/vim-polyglot",
  "navarasu/onedark.nvim",
  { 
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  "tpope/vim-surround"
})

-- Theme config & load
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- Better escape options
require("better_escape").setup {
  mapping = {"jl"}, -- a table with mappings to use
  timeout = 100,-- the time in which the keys must be hit in ms. Use option timeoutlen by default
  clear_empty_lines = false, -- clear line after escaping if there is only whitespace
 }
 
