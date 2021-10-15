return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/which-key.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'editorconfig/editorconfig-vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
 end)

