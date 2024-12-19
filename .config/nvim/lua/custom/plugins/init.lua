-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

return {
  {
    'max397574/better-escape.nvim',
    opts = {
      timeout = 100,
      mappings = {
        i = {
          j = {
            -- Disable default jk as too many Dutch words contain it
            k = false,
            l = '<Esc>',
          },
        },
        c = {
          j = {
            k = false,
            l = '<Esc>',
          },
        },
        t = {
          j = {
            k = false,
            l = '<C-\\><C-n>',
          },
        },
        v = {
          j = {
            l = '<Esc>',
          },
        },
        s = {
          j = {
            l = '<Esc>',
          },
        },
      },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      {
        'sindrets/diffview.nvim',
        opts = function()
          local actions = require 'diffview.actions'
          return {
            keymaps = {
              view = {
                ['q'] = '<Cmd>DiffviewClose<CR>',
                ['\\'] = actions.toggle_files,
              },
              file_panel = {
                ['q'] = actions.toggle_files,
                ['\\'] = actions.toggle_files,
              },
            },
          }
        end,
      }, -- optional - Diff integration
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      kind = 'replace',
    },
  },
  -- Disabling it for now
  -- { 'wakatime/vim-wakatime', lazy = false },
  {
    'chomosuke/term-edit.nvim',
    opts = {
      prompt_end = '%$ ',
      -- feedkeys_delay = 2,
    },
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  },
}
