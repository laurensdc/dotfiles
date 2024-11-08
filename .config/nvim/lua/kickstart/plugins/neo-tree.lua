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
        leave_dirs_open = false,
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
}
