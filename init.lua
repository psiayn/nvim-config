vim.cmd [[
filetype plugin indent on
syntax enable
set nu
set mouse=a
set colorcolumn=80
nnoremap <SPACE> <Nop>
let mapleader=" "
set laststatus=3
autocmd Filetype lua,javascript,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set splitbelow
set splitright
]]

require("psiayn")
vim.cmd('colorscheme gruvbox')

