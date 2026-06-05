return {

  -- Coding
  { "nvim-mini/mini.pairs", enabled = false },
  { "folke/ts-comments.nvim", enabled = false },
  { "nvim-mini/mini.ai", enabled = false },
  -- { "folke/lazydev.nvim", enabled = false },

  -- Themes
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  -- Editor
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },

  -- UI
  -- Unfortunately, treesitter is just way too slow, increasing nvim launch time by 200ms
  { "nvim-treesitter/nvim-treesitter", enabled = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
  { "windwp/nvim-ts-autotag", enabled = false },
  { "folke/noice.nvim", enabled = false },
  -- { "nvim-mini/mini.icons", enabled = false },

  -- Util
  { "folke/persistence.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      -- picker = { enabled = false, },
    },
  },
}
