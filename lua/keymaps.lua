
-- setting up space as leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- nvim tree toggle
vim.api.nvim_set_keymap('n', '<Leader>t', ':CHADopen<CR>', { noremap = true, silent = true })

-- lsp keybindings
local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local opts = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
set_keymap('n', '<space>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
set_keymap('n', '<space>rf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- better buffer switching
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', { noremap = true })

-- completion go brr
vim.cmd([[
autocmd BufEnter * lua require'completion'.on_attach()
]])
vim.api.nvim_set_keymap('i', '<expr><TAB>', 'pumvisible() ? \"\\<C-n>\" : \"\\<TAB>\"', { noremap = true})
vim.api.nvim_set_keymap('i', '<expr><S-TAB>', 'pumvisible() ? \"\\<C-p>\" : \"\\<S-TAB>\"', { noremap = true})
vim.g.completeopt = 'menuone,noinsert,noselect'
vim.cmd('set shortmess+=c')
vim.api.nvim_set_keymap('i', '<tab>', '<Plug>(completion_smart_tab)', {})
vim.api.nvim_set_keymap('i', '<s-tab>', '<Plug>(completion_smart_s_tab)', {})
