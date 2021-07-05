-- custom configs
vim.wo.number = true
require('zephyr')
vim.cmd([[
set splitbelow
set splitright
]]) 
vim.cmd('set mouse=a') vim.api.nvim_set_option('tabstop', 4) vim.api.nvim_set_option('shiftwidth', 4)

require'nvim-web-devicons'.get_icons()

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

require'lspconfig'.rnix.setup{}

require'lspconfig'.clangd.setup{}

require'lspconfig'.dartls.setup{}

require'lspconfig'.gopls.setup{}

require'lspconfig'.tsserver.setup{}

-- nvim-metals

vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
vim.cmd [[augroup end]]
metals_config = require'metals'.bare_config
metals_config.init_options.statusBarProvider = 'on'
