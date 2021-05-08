-- custom configs
vim.wo.number = true
require('zephyr')
vim.cmd([[
set splitbelow
set splitright
]])
vim.cmd([[
if has("gui_vimr")
	colorscheme two-firewatch
	set bg=dark
	let g:two_firewatch_italics=1
	colo two-firewatch
endif
]])
vim.cmd('set mouse=a')
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
-- treesitter config
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}

-- indent guides
require('indent_guides').setup({})

-- haha filetype go brr
vim.o.foldmethod = 'indent'
-- vim.o.foldmethod = 'expr'
vim.cmd('filetype plugin indent on')
vim.o.foldexpr = 'nvim_tresitter#foldexpr()'
vim.api.nvim_set_option('fdm', 'indent')
vim.cmd([[
autocmd FileType nroff setlocal fdm=marker
autocmd FileType vim setlocal fdm=marker
autocmd FileType zsh setlocal fdm=marker
]])
--afterglow themes
vim.g.afterglow_inherit_background = 1
-- airline configuration
-- vim.g.airline_powerline_fonts = 1
-- -- vim.g.airline_theme = 'twofirewatch'

-- lsp config
vim.cmd('set completeopt=menuone,noinsert,noselect')
vim.g.completion_auto_change_source = true
vim.g.completion_chain_complete_list = {
  default = {
    default = {
      { complete_items = {'lsp', 'snippets', 'ts'} },
    },
   string = {
      { mode = 'file' },  -- use ins-complete "files" (search     ins-compl in completion-nvim help)
   },
  },
}

require'lspinstall'.setup() -- important

require'lspconfig'.clangd.setup{}

require'lspconfig'.dartls.setup{}

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
