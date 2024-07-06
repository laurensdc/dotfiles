-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'max397574/better-escape.nvim',
    opts = {
      timeout = 80,
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
            l = '<Esc>',
          },
        },
        t = {
          j = {
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
}
