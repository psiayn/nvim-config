vim.cmd('set mouse=a')
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.cmd('set termguicolors')

require'nvim-web-devicons'.get_icons()
require'colorizer'.setup()

-- haha filetype go brr
-- vim.o.foldmethod = 'indent'
vim.o.foldmethod = 'expr'
vim.cmd('filetype plugin indent on')
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.api.nvim_set_option('fdm', 'indent')
vim.cmd([[
autocmd FileType nroff setlocal fdm=marker
autocmd FileType vim setlocal fdm=marker
autocmd FileType zsh setlocal fdm=marker
]])

-- vim.o.shiftwidth = 2
-- vim.bo.shiftwidth = 2

-- vim.o.softtabstop = 2
-- vim.bo.softtabstop = 2

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.shiftround = false

 
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
  indent = {
    enable = true
  },
}

-- nice COQ bro
vim.g.coq_settings = {auto_start = 'shut-up'}

-- require'lspconfig'.clangd.setup{}

require'lspconfig'.gopls.setup{}

-- require'lspconfig'.tsserver.setup{}

require'lspconfig'.dartls.setup{}
require'lspconfig'.rust_analyzer.setup{}

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end) -- important

require('keymaps')


local nvim_lsp = require("lspconfig")

local on_attach = function (client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- enable completion triggered by <C-x><C-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true }

  -- keybindings go brrr
  buf_set_keymap('n', '<space>rf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
end

vim.cmd([[
set background=dark
colorscheme gruvbox
let g:gruvbox_transparent_bg = 1
autocmd VimEnter * hi Normal ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
set splitbelow
set splitright
set nu rnu
]]) 

-- airline
vim.g.airline_powerline_fonts = true
vim.cmd([[
let g:airline#extensions#tabline#enabled = 1
]])

-- 80 character limit
vim.cmd([[
set colorcolumn=80
]])

-- vimwiki
vim.cmd([[
let g:vimwiki_list = [{'path': '~/Sync/vimwiki/wiki', 'path_html': '~/Sync/vimwiki/html', 'syntax': 'markdown', 'ext': 'md'}]
]])
