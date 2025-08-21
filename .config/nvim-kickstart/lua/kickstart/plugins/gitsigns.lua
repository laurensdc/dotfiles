-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '-' },
        changedelete = { text = '-' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- test

        -- Navigation
        map('n', ']d', function()
          if vim.wo.diff then
            vim.cmd.normal { ']d', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next git [D]iff', noremap = true })

        map('n', '[d', function()
          if vim.wo.diff then
            vim.cmd.normal { '[d', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Previous git [D]iff', noremap = true })

        -- Actions
        -- visual mode
        map('v', '<leader>ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [H]unk [S]tage' })
        map('v', '<leader>ghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [H]unk [R]eset' })

        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[G]it [H]unk (Un-)[S]tage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[G]it [H]unk [R]eset' })

        map('n', '<leader>gs', gitsigns.stage_buffer, { desc = '[G]it [S]tage current buffer' })
        map('n', '<leader>gu', gitsigns.reset_buffer_index, { desc = '[G]it [U]nstage current buffer' })
        map('n', '<leader>grr', gitsigns.reset_buffer, { desc = '[G]it [R]eally [R]eset buffer' })

        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it [P]review changes' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = '[G]it [B]lame' })
        -- map('n', '<leader>hD', function()
        --   gitsigns.diffthis '@'
        -- end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        -- map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
