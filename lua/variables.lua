-- require('zephyr')
vim.opt.termguicolors = true
-- require('spaceodyssey')
vim.cmd([[
colorscheme 256_noir
set splitbelow
set splitright
set nu rnu
]]) 
vim.cmd('set mouse=a') vim.api.nvim_set_option('tabstop', 4) vim.api.nvim_set_option('shiftwidth', 4)

require'nvim-web-devicons'.get_icons()
require'colorizer'.setup()
-- staline

-- require'staline'.setup{
-- 	sections = {
-- 		left = {'- ', '-mode', 'left_sep_double', 'file_name', '  ', 'branch'},
-- 		mid  = {'lsp'},
-- 		right= { 'cool_symbol', '  ', vim.bo.fileencoding, 'right_sep_double', '-line_column'}
-- 	},
-- 	-- defaults = {
-- 	-- 	cool_symbol = "  ",
-- 	-- 	left_separator = "",
-- 	-- 	right_separator = "",
-- 	-- 	bg = "#303030",
-- 	-- 	full_path = false,
	-- 	branch_symbol = " "
-- 	-- },
-- 	-- mode_colors = {
-- 	-- 	n = "#986fec",
-- 	-- 	i = "#e86671",
-- 	-- 	ic= "#e86671",
-- 	-- 	c = "#e27d60"
-- 	-- }
-- }


require "staline".setup {
	sections = {
		left = { 'cool_symbol', 'mode', ' ', 'branch', ' '},
		mid = { 'lsp' },
		right = {'file_name', 'line_column' }
	},
	mode_colors = {
		i = "#d4be98",
		n = "#84a598",
		c = "#8fbf7f",
		v = "#fc802d",
	},
	defaults = {
		branch_symbol = " ",
		cool_symbol = "  ",
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
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

require('gitsigns').setup()
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

-- nice COQ bro
vim.g.coq_settings = {auto_start = true}

-- require'lspconfig'.clangd.setup{}

-- require'lspconfig'.gopls.setup{}

-- require'lspconfig'.tsserver.setup{}

-- require'lspconfig'.dartls.setup{}

require'lspinstall'.setup() -- important

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end


local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
	  on_attach = on_attach,
  }
end



-- nvim-metals

vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
vim.cmd [[augroup end]]
metals_config = require'metals'.bare_config
metals_config.init_options.statusBarProvider = 'on'
