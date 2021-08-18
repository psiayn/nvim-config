-- require('zephyr')
vim.opt.termguicolors = true
vim.cmd([[
colorscheme xshado
set splitbelow
set splitright
set nu rnu
]]) 
vim.cmd('set mouse=a') vim.api.nvim_set_option('tabstop', 4) vim.api.nvim_set_option('shiftwidth', 4)

require'nvim-web-devicons'.get_icons()

-- staline

require'staline'.setup{
	sections = {
		left = {'- ', '-mode', 'left_sep_double', 'file_name', '  ', 'branch'},
		mid  = {'lsp'},
		right= { 'cool_symbol', '  ', vim.bo.fileencoding, 'right_sep_double', '-line_column'}
	},
	defaults = {
		cool_symbol = "  ",
		left_separator = "",
		right_separator = "",
		bg = "#303030",
		full_path = false,
		branch_symbol = " "
	},
	mode_colors = {
		n = "#986fec",
		i = "#e86671",
		ic= "#e86671",
		c = "#e27d60"
	}
}

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

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}



-- require'lspconfig'.clangd.setup{}

-- require'lspconfig'.gopls.setup{}

-- require'lspconfig'.tsserver.setup{}

-- require'lspconfig'.pyright.setup{}

require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end



-- nvim-metals

vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
vim.cmd [[augroup end]]
metals_config = require'metals'.bare_config
metals_config.init_options.statusBarProvider = 'on'
