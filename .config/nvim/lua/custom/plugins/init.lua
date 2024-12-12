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
      'sindrets/diffview.nvim', -- optional - Diff integration
      'nvim-telescope/telescope.nvim',
    },
    config = true,
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
    'olacin/telescope-gitmoji.nvim',
    config = function()
      require('telescope').load_extension 'gitmoji'
    end,
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
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
