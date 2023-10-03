-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- NeoVide Setup
if vim.g.neovide then
  local conf = vim.g
  local map = vim.api.nvim_set_keymap

  conf.neovide_remember_window_size = true
  conf.neovide_confirm_quit = true
  conf.neovide_fullscreen = true
  conf.neovide_input_use_logo = 1

  map("", "<D-v>", "+p<CR>", { noremap = true, silent = true, desc = "Paste" })
  map("!", "<D-v>", "<C-R>+", { noremap = true, silent = true, desc = "Paste" })
  map("t", "<D-v>", "<C-R>+", { noremap = true, silent = true, desc = "Paste" })
  map("v", "<D-v>", "<C-R>+", { noremap = true, silent = true, desc = "Paste" })
end

vim.opt.swapfile = false
