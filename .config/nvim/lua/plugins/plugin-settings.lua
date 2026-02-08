return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },

      servers = {
        -- Disable autoformat for Prisma
        prismals = {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        ["*"] = {
          keys = {
            {
              "<leader>ss",
              function()
                Snacks.picker.lsp_workspace_symbols()
              end,
              desc = "LSP Workspace Symbols",
              has = "documentSymbol",
            },
            {
              "<leader>sS",
              function()
                Snacks.picker.lsp_symbols()
              end,
              desc = "LSP Symbols",
              has = "workspace/symbols",
            },
          },
        },
        -- tsserver = { enabled = false },
        -- vtsls = { enabled = false },
        -- tsgo = {
        --   cmd = { "tsgo", "--lsp", "--stdio" },
        --   filetypes = {
        --     "javascript",
        --     "javascriptreact",
        --     "javascript.jsx",
        --     "typescript",
        --     "typescriptreact",
        --     "typescript.tsx",
        --   },
        --   root_markers = {
        --     "tsconfig.json",
        --     "jsconfig.json",
        --     "package.json",
        --     ".git",
        --     "tsconfig.base.json",
        --   },
        --   enabled = true,
        -- },

        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
            },
            javascript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
            },
          },
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
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "ayu",
      },
    },
  },
}
