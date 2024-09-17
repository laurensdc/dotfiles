-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Options for session
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

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
            l = '<Esc>',
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
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    opts = {
      auto_restore_last_lession = true,
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      use_git_branch = true,
    },
  },
}
