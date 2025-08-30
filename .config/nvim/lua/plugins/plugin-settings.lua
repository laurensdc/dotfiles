return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },

      -- Disable autoformat for Prisma
      servers = {
        prismals = {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
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
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- Insert completion item on selection, don't select by default
        list = {
          selection = {
            auto_insert = false,
          },
        },
      },
      keymap = {
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show" },
      },
    },
  },
}
