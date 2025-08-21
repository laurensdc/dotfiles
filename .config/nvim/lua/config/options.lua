-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

vim.lsp.inlay_hint.enable(false)

-- [[ Neovide configuration ]]
if vim.g.neovide then
  -- vim.o.guifont = 'Comic Code Ligatures,FiraCode Nerd Font Mono:h14'
  vim.o.guifont = "Comic Code Ligatures,FiraCode Nerd Font:h14"

  -- Eye candy and beautiful Neovim
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_scroll_animation_length = 0.10
  vim.g.neovide_position_animation_length = 0.4
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_smooth_blink = true

  -- Usability
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_hide_mouse_when_typing = true

  -- Window size stuff
  vim.g.neovide_remember_window_size = true

  -- Scale font with cmd+ and cmd-
  vim.keymap.set(
    "n",
    "<D-=>",
    ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  2)<CR>",
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<D-->",
    ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.5)<CR>",
    { silent = true }
  )
  vim.keymap.set("n", "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
