-- Neovim Configs
vim.g.mapleader = " "
vim.wo.number = true
vim.opt.relativenumber = true

vim.cmd("set cmdheight=0")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.swapfile = false

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Mappings
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", ":qa!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})

-- Comment.nvim
vim.keymap.set(
  "n",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)<cr>",
  {}
)
vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {})

vim.keymap.set(
  "n",
  "<leader>//",
  "<esc><cmd>lua require('Comment.api').toggle.blockwise.count(vim.v.count > 0 and vim.v.count or 1)<cr>",
  {}
)
vim.keymap.set("v", "<leader>//", "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>", {})

-- NvimTree
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Format on Save
vim.cmd([[
  augroup lsp_autoformat
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
  augroup END
]])
