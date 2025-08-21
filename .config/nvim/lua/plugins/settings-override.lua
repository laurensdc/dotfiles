return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>f.",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      { "<leader>.", false },
      {
        "<leader>fs",
        function()
          Snacks.scratch()
        end,
        desc = "Find Scratch Buffer",
      },
      { "<leader>S", false },
      {
        "<leader>fS",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
    },
  },
}
