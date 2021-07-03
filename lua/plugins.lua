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
  -- nvim-tree
  use 'kyazdani42/nvim-tree.lua'

  use 'nvim-treesitter/nvim-treesitter'
  -- use 'nvim-treesitter/completion-treesitter'
  -- airline 
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  -- use 'bling/vim-bufferline'
  -- lsp go brr
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'LnL7/vim-nix'
  use 'scalameta/nvim-metals'
  -- easy of lifes
  use 'kien/ctrlp.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'tpope/vim-fugitive'
  -- themes
  use 'danilo-augusto/vim-afterglow'
  use 'rakr/vim-two-firewatch'
  use 'glepnir/zephyr-nvim'
  -- expressline gotta go fast
  use 'tjdevries/express_line.nvim'
end)
