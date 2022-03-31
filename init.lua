vim.cmd[[
filetype plugin indent on
syntax enable
set nu
set mouse=a
set colorcolumn=80
nnoremap <SPACE> <Nop>
let mapleader=" "
set laststatus=3
set tabstop=2
set shiftwidth=2
]]

require("psiayn")
vim.cmd('colorscheme wal')

