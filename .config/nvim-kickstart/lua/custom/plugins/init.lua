-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

return {
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
      kind = 'replace', -- Open in same buffer instead of new tabpage
      disable_insert_on_commit = true, -- Enter in normal mode so we can gitmoji 🚀
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
      keymaps = {
        ['<C-k>'] = { 'actions.parent', mode = 'n' },
        ['<C-l>'] = {
          callback = 'actions.select',
          mode = 'n',
        },
        ['<C-j>'] = {
          callback = 'actions.select',
          mode = 'n',
        },
        ['q'] = { 'actions.close', mode = 'n' },
        ['.'] = {
          'actions.cd',
          mode = 'n',
        },
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  },
}
