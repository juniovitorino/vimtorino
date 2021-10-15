vim.g.mapleader = ' '

local wk = require("which-key")
local map = vim.api.nvim_set_keymap

map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

local mappings = {
  q = {":q<cr>", "Quit"},
  c = {":bdelete<cr>", "Close"},
  p = {":Telescope find_files<cr>", "Find files"},
  ff = {":Telescope live_grep<cr>", "Find in files"},
  e = {":e ~/.config/nvim/init.lua<cr>", "Settings"},
  W = {":wq<cr>", "Save and close"},
  n = {":tabnew<cr>", "New tab"},
  w = {":w<cr>", "Save"},
  e = {":NvimTreeToggle<cr>", "Explorer"},
  gg = {":LazyGit<cr>", "LazyGit"}
}

local options = {
  prefix = '<leader>'
}

wk.register(mappings, options)
