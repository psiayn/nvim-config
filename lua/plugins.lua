local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- nvim-treesitter
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/completion-treesitter'
  use 'editorconfig/editorconfig-vim'
  -- lsp go brr
  use 'neovim/nvim-lspconfig'
  use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets
  use {'ms-jpq/coq.thirdparty', branch= '3p'}
  use 'nvim-lua/completion-nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'LnL7/vim-nix'
  use 'lark-parser/vim-lark-syntax'
  -- easy of lifes
  use 'kien/ctrlp.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'akinsho/bufferline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'ThePrimeagen/harpoon'
  -- themes
  use 'danilo-augusto/vim-afterglow'
  -- chadtree
  use {'ms-jpq/chadtree', branch = 'chad'}
  -- staline
  use 'tamton-aquib/staline.nvim'
end)
