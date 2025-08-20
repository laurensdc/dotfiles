--[[
===========================================================
===                                    .-----.          ===
===         .----------------------.   | === |          ===
===         |.-""""""""""""""""""-.|   |-----|          ===
===         ||                    ||   | === |          ===
===         ||   KICKSTART.NVIM   ||   |-----|          ===
===         ||                    ||   | === |          ===
===         ||   Laurens' config  ||   |-----|          ===
===         ||                    ||   |:::::|          ===
===         |'-..................-'|   |____o|          ===
===         `"")----------------(""`   ___________      ===
===        /::::::::::|  |::::::::::\  \  nothing \     ===
===       /:::========|  |==hjkl==:::\  \   here   \    ===
===      '""""""""""""'  '""""""""""""'  '""""""""""'   ===
===                                                     ===
===========================================================
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Persistent undo through file close
vim.opt.undofile = true

-- share system clipboard for yank & paste
-- need xclip on Linux
vim.opt.clipboard = 'unnamedplus'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-- :noh to remove the highlights
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- modern vim only
vim.opt.compatible = false

-- syntax sugar plz
vim.opt.syntax = 'on'

-- file name on top
vim.opt.title = true

-- 4 spaces for tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- Insert spaces when tab is pressed
vim.opt.expandtab = true

-- Set the terminal type
vim.env.TERM = 'xterm-256color'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Automatically change project root when switching buffer or switching file
-- can set it by hitting dot while using neotree
vim.opt.autochdir = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Show folds
vim.opt.foldcolumn = 'auto:2'

-- zC to close all folds (big zc)
vim.keymap.set('n', 'zC', 'zM')

-- zO to open all folds (big zo)
vim.keymap.set('n', 'zO', 'zR')

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- Old tab symbol: »
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 12

-- Wrap lines
vim.opt.wrap = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Disable in-line diagnostic messages
vim.diagnostic.config {
  virtual_text = false, -- Disable in-line messages
  signs = true, -- Show signs in the gutter
  underline = true, -- Underline the problematic text
  update_in_insert = true, -- Update diagnostics in insert mode
  severity_sort = true, -- Sort diagnostics by severity
}

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- zz after page scrolls
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- zz after finds
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Don't x to clipboard
vim.keymap.set('n', 'x', '"_x', { noremap = true })
vim.keymap.set('n', 'X', '"_X', { noremap = true })

-- Q instead of q for macros
vim.keymap.set('n', 'Q', 'q')
vim.keymap.set('n', 'q', '<Nop>', { noremap = true })

-- Diagnostic keymaps
-- NOTE: Calling the open_float() function twice so that we immediately focus the floating window
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.open_float()
  vim.diagnostic.open_float()
end, { desc = '[D]ebug [D]iagnostic' })

-- Composite escape
vim.keymap.set({ 'i' }, 'jl', '<esc>', { noremap = true })

-- D when text is selected won't send text to paste register
vim.keymap.set('v', 'D', '"_d', { noremap = true })

-- Jump to next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [D]iagnostic' })
-- Jump to previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous [D]iagnostic' })

vim.keymap.set('n', '<leader>bD', ':%bd!|e#<CR>', { desc = '[B]uffer [D]elete all' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-c>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-x>', '<C-c>', { desc = 'Send kill signal' })
vim.keymap.set('t', 'jl', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<D-v>', '<C-\\><C-n>"+pi', { desc = 'Paste in terminal mode (and fzf-lua)' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
-- Option + hjkl to focus windows
vim.keymap.set({ 'n' }, '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n' }, '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n' }, '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n' }, '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Option + v/s to vsplit/split
vim.keymap.set({ 'n' }, '<M-v>', '<C-w><C-v>', { desc = 'Vertical split window' })
vim.keymap.set({ 'n' }, '<M-s>', '<C-w><C-s>', { desc = 'Horizontal split window' })

-- Option + n/p for quickfix list navigation
vim.keymap.set({ 'n' }, '<M-n>', '<CMD>cnext<CR>', { desc = 'Select next quickfix list item' })
vim.keymap.set({ 'n' }, '<M-p>', '<CMD>cprev<CR>', { desc = 'Select previous quickfix list item' })

-- Open Neogit
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = '[G]oto Neo[G]it', silent = true })

-- Copy file paths to clipboard
local function get_git_root()
  return vim.fn.system('git rev-parse --show-toplevel'):gsub('\n', '')
end

local function is_git_repo()
  local git_root = get_git_root()
  return vim.v.shell_error == 0 and git_root and git_root ~= ''
end

vim.keymap.set('n', '<leader>cr', function()
  -- If we’re inside a Git repository, compute the relative path
  if is_git_repo() then
    local file_path = vim.fn.expand '%:p' -- Absolute path of the current file
    local relative_path = file_path:sub(#get_git_root() + 2) -- Strip Git root path + '/' (1 extra character)
    vim.fn.setreg('+', relative_path)
    print('Copied relative path to clipboard: ' .. relative_path)
  else
    -- Else, copy file path
    vim.fn.setreg('+', vim.fn.expand '%')
    print('Copied absolute path to clipboard: ' .. vim.fn.expand '%')
  end
end, { desc = '[C]opy [R]elative Path to clipboard' })
vim.keymap.set('n', '<leader>ca', ':let @+=expand("%:p")<CR>', { desc = '[C]opy [A]bsolute Path to clipboard' })
vim.keymap.set('n', '<leader>cf', ':let @+=expand("%:t")<CR>', { desc = '[C]opy [F]ilename to clipboard' })

-- [[ Cmd and option keys ]]
--
-- Ctrl + backspace deletes word
vim.keymap.set({ 'i', 'c', 't' }, '<C-BS>', '<C-w>')
-- Option + backspace deletes word
vim.keymap.set({ 'i', 'c', 't' }, '<M-BS>', '<C-w>')

-- Cmd + w to close window
vim.keymap.set('n', '<D-w>', '<C-w><C-q>', { desc = 'Close window' })
-- Option + w also, when splitting and moving, it's easier
vim.keymap.set('n', '<M-w>', '<C-w><C-q>', { desc = 'Close window' })

-- Cmd + V to paste
vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+p')
vim.keymap.set({ 'i', 'c', 't' }, '<D-v>', '<C-r>+')

-- Cmd + C to copy
vim.keymap.set({ 'v', 't' }, '<D-c>', 'y')

-- Cmd + A to select all and yank it
vim.keymap.set({ 'i', 'n', 'v' }, '<D-a>', '<Esc>msggVGy`szz')

-- Cmd + Z to undo
vim.keymap.set({ 'n', 'v', 'i', 'c', 't' }, '<D-z>', '<cmd>undo<CR>')
-- Cmd + Shift + Z to redo
vim.keymap.set({ 'n', 'v', 'i', 'c', 't' }, '<D-S-z>', '<cmd>redo<CR>')

-- Cmd + s to save and escape
vim.keymap.set({ 'i', 'n', 'v', 'x' }, '<D-s>', '<cmd>w<CR><esc>', { desc = 'Save file', silent = true })

-- [[ Neovide configuration ]]
if vim.g.neovide then
  -- vim.o.guifont = 'Comic Code Ligatures,FiraCode Nerd Font Mono:h14'
  vim.o.guifont = 'Comic Code Ligatures,FiraCode Nerd Font:h14'

  -- Eye candy and beautiful Neovim
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_scroll_animation_length = 0.10
  vim.g.neovide_position_animation_length = 0.4
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_smooth_blink = true

  -- Usability
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_input_macos_option_key_is_meta = 'both'
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_hide_mouse_when_typing = true

  -- Window size stuff
  vim.g.neovide_remember_window_size = true

  -- Scale font with cmd+ and cmd-
  vim.keymap.set('n', '<D-=>', ':lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  2)<CR>', { silent = true })
  vim.keymap.set('n', '<D-->', ':lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.5)<CR>', { silent = true })
  vim.keymap.set('n', '<D-0>', ':lua vim.g.neovide_scale_factor = 1<CR>', { silent = true })
end

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open terminal and put it nicely in the bottom in insert mode ✨
local function open_term()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.cmd.startinsert()
  vim.api.nvim_win_set_height(0, 15)
end

vim.keymap.set('n', '<leader>t', open_term, { desc = '[T]erminal' })
vim.keymap.set('n', '<D-t>', open_term, { desc = '[T]erminal' })

vim.keymap.set('n', '<leader>dm', function()
  local messages = vim.fn.execute 'messages'
  vim.cmd 'new'
  vim.bo.buftype = 'nofile'
  vim.bo.swapfile = false
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(messages, '\n'))
end, { desc = '[D]ebug [M]essages', silent = true })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      spec = {
        { '<leader>b', group = '[B]uffer' },
        { '<leader>b_', hidden = true },
        { '<leader>c', group = '[C]opy / [C]omment' },
        { '<leader>c_', hidden = true },
        { '<leader>f', group = '[F]ind' },
        { '<leader>f_', hidden = true },
        { '<leader>g', group = '[G]oto / [G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      {
        'olacin/telescope-gitmoji.nvim',
        opts = {},
      },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        defaults = {
          path_display = {
            shorten = {
              len = 3,
              exclude = { -1, -2, -3 },
            },
          },
          dynamic_preview_title = true,
          -- layout_strategy = 'flex',
          layout_config = {
            width = { padding = 0 },
            height = { padding = 0 },
          },
          mappings = {
            n = {
              ['q'] = require('telescope.actions').close,
              ['<C-c>'] = require('telescope.actions').close,
              ['<D-w'] = require('telescope.actions').close,
            },
            i = {
              -- Delete word on option + backspace
              ['<M-BS>'] = function()
                vim.cmd 'normal! db'
              end,
            },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          gitmoji = {
            action = function(entry)
              local emoji = entry.value.value -- entry.value.value for the emoji, entry.value.text for the text
              vim.api.nvim_put({ emoji .. ' ' }, 'c', true, true)

              -- hit 'a' to insert mode after character
              vim.api.nvim_feedkeys('a', 'n', false)
            end,
          },
        },
      }

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      -- Search the search!
      vim.keymap.set('n', '<leader>fa', builtin.builtin, { desc = '[F]ind [A]ll Telescope pickers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fl', builtin.resume, { desc = '[F]ind the [L]ast thing again' })

      -- Gitmoji!
      vim.keymap.set('n', '<leader>gm', function()
        require('telescope').extensions.gitmoji.gitmoji()
      end, { desc = '[G]it [M]oji picker!' })

      -- Find files in git repo or cwd
      vim.keymap.set('n', '<leader>ff', function()
        if is_git_repo() then
          builtin.git_files { show_untracked = true, prompt_title = 'Find files in repo ' .. get_git_root() }
        else
          builtin.find_files { hidden = true, prompt_title = 'Find files in dir ' .. vim.fn.getcwd() }
        end
      end, { desc = '[F]ind [F]iles in git repo or cwd' })

      -- Grep in git repo or cwd
      vim.keymap.set('n', '<leader>fg', function()
        local project_root = is_git_repo() and get_git_root() or vim.fn.getcwd()
        local prompt_title_word = ' dir '
        if is_git_repo() then
          prompt_title_word = ' repo '
        end
        builtin.live_grep {
          cwd = project_root,
          -- Pass options to ripgrep:
          --  search files and directories starting with a dot
          --  but don't search in .git directories
          additional_args = function()
            return { '--hidden', '--glob=!**/.git/**' }
          end,
          prompt_title = 'Grepping in' .. prompt_title_word .. project_root,
        }
      end, { desc = '[F]ind by [G]repping' })

      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostic' })
      vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind [.] Recent Files' })

      vim.keymap.set('n', '<leader>ft', function()
        require('telescope.builtin').colorscheme { enable_preview = true }
      end, { desc = '[F]ind [T]hemes' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>f/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 30,
          previewer = false,
          layout_config = {
            height = 30,
            width = 80,
          },
        })
      end, { desc = '[F]ind [/] fuzzily in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      -- vim.keymap.set('n', '<leader>f/', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt_title = 'Live Grep in Open Files',
      --   }
      -- end, { desc = '[F]ind [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind Neovim [C]onfiguration files' })

      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'gitmoji'
      require('telescope').load_extension 'ui-select'
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an LSP (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local telescope = require 'telescope.builtin'

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          -- TODO: Remap tot Goto [T]ype? But now gt is goto tab, so swap that to cmd+shift+]
          map('gD', telescope.lsp_type_definitions, '[G]oto Type [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', telescope.lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')

          -- Find symbols
          map('<leader>fls', telescope.lsp_document_symbols, '[F]ind [L]ocal [S]ymbols in document')
          map('<leader>fs', telescope.lsp_workspace_symbols, '[F]ind Workspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          -- Cmd + r also to rename
          map('<D-r>', vim.lsp.buf.rename, 'Rename')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          vim.keymap.set({ 'n', 'v' }, '<leader>.', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Code Action (like VSCode cmd+.)' })
          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          -- TODO: Will I ever use this? Comment out for now
          -- map('<leader>gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            -- Disable this in VSCode so that we don't get warning popups there
            -- there, lsp.buf.clear_references does not exist
            if not vim.g.vscode then
              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })
            end

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

      local rust_exists = vim.fn.executable 'cargo' == 1
      local go_exists = vim.fn.executable 'go' == 1
      local deno_exists = vim.fn.executable 'deno' == 1
      local node_exists = vim.fn.executable 'node' == 1

      local servers = {
        -- See `:help lspconfig-all` for a list of all the pre-configured LSPs

        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- Either load ts_ls or denols, not both as it gets messy
        ts_ls = node_exists and {
          -- Only load in projects with tsconfig.json
          root_dir = require('lspconfig').util.root_pattern('tsconfig.json', 'package.json'),
          single_file_support = false,
        },
        denols = deno_exists and {
          root_dir = require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc'),
        },

        cssls = {},
        css_variables = {},
        cssmodules_ls = {},
        eslint = node_exists and {}, -- eslint-lsp
        eslint_d = node_exists and {},
        gopls = go_exists and {},
        html = {},
        htmx = rust_exists and {
          filetypes = { 'html' },
        },
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        markdownlint = {},
        prettierd = node_exists and {},
        stylua = rust_exists and {},
        terraformls = go_exists and {},
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      require('mason-tool-installer').setup {
        ensure_installed = vim.tbl_filter(function(server)
          return servers[server] -- Only add to the installer if the server is enabled
        end, ensure_installed),
      }

      require('mason-lspconfig').setup {
        ensure_installed = servers,
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,

      -- Format asynchronously on save
      format_on_save = function(bufnr)
        local slow_format_filetypes = { typescript = true, javascript = true }

        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end

        local function on_format(err)
          if err and err:match 'timeout$' then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 200, lsp_format = 'fallback' }, on_format
      end,

      format_after_save = function(bufnr)
        local slow_format_filetypes = { typescript = true, javascript = true }

        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_format = 'fallback' }
      end,

      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        lua = { 'stylua' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        json = { 'prettierd' },
        markdown = { 'markdownlint' },
        css = { 'prettierd' },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert,preview' },

        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [u]p / [d]own
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          -- Scroll a lot with [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-8),
          ['<C-f>'] = cmp.mapping.scroll_docs(8),

          -- Accept the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<Tab>'] = cmp.mapping.confirm { select = true },
          ['<CR>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
  -- {
  --   'maxmx03/dracula.nvim',
  -- },
  -- {
  --   'nyoom-engineering/oxocarbon.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'oxocarbon'
  --   end,
  -- },
  { 'folke/tokyonight.nvim' },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      -- require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint', -- Linting with LSP now
  -- require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
