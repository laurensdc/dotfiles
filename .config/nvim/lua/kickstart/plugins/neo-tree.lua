-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal_force_cwd<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_hidden = false,
        hide_dotfiles = false,
        visible = true,
        hide_gitignored = true,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<C-k>'] = 'navigate_up',
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<C-h>'] = 'close_all_nodes',
          -- Show hidden files by default and have H jump up in the buffer
          ['H'] = 'noop',
        },
      },
    },
  },
  -- Allow copying current file to clipboard
  -- TODO: Can't get this to work either
  --
  --[[ commands = {
    copy_selector = function(state)
      local node = state.tree:get_node()
      local filepath = node:get_id()
      local filename = node.name
      local modify = vim.fn.fnamemodify

      local vals = {
        ['BASENAME'] = modify(filename, ':r'),
        ['EXTENSION'] = modify(filename, ':e'),
        ['FILENAME'] = filename,
        ['PATH (CWD)'] = modify(filepath, ':.'),
        ['PATH (HOME)'] = modify(filepath, ':~'),
        ['PATH'] = filepath,
        ['URI'] = vim.uri_from_fname(filepath),
      }

      local options = vim.tbl_filter(function(val)
        return vals[val] ~= ''
      end, vim.tbl_keys(vals))
      if vim.tbl_isempty(options) then
        vim.notify('No values to copy', vim.log.levels.WARN)
        return
      end
      table.sort(options)
      vim.ui.select(options, {
        prompt = 'Choose to copy to clipboard:',
        format_item = function(item)
          return ('%s: %s'):format(item, vals[item])
        end,
      }, function(choice)
        local result = vals[choice]
        if result then
          vim.notify(('Copied: `%s`'):format(result))
          vim.fn.setreg('+', result)
        end
      end)
    end,
  },
  window = {
    mappings = {
      Y = 'copy_selector',
    },
  }, ]]
}
