-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Persistent undo through file close
vim.opt.undofile = true

-- share system clipboard for yank & paste
vim.opt.clipboard = unnamedplus

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
})

-- Theme config & load
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()


