if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/psiayn/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/psiayn/.local/share/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/psiayn/.local/share/dein/repos/github.com/Shougo/dein.vim')

" Plugins

" Basic Utils
call dein#add('NTBBloodbath/galaxyline.nvim')
call dein#add('rebelot/heirline.nvim')
call dein#add('kvrohit/substrata.nvim')
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('kyazdani42/nvim-tree.lua')
call dein#add('nvim-lua/plenary.nvim')

" Additional Coconut Oil
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('nvim-telescope/telescope.nvim')

" LSP
call dein#add('neovim/nvim-lspconfig')
call dein#add('williamboman/nvim-lsp-installer')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-path')
call dein#add('hrsh7th/cmp-nvim-lua')
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('L3MON4D3/LuaSnip')
call dein#add('saadparwaiz1/cmp_luasnip')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" line numbers
set nu
set rnu

" utilities
set mouse=a
set colorcolumn=80
nnoremap <SPACE> <Nop>
let mapleader=" "

" colorscheme
set termguicolors
let g:substrata_variant = "brighter"
colorscheme substrata

" global statusline: neovim nightly only 
set laststatus=3

" All lua code
lua require("psiayn")
