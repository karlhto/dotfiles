" Autocompletion and linting
" --------------------------
" Most options previously relevant for this file can be found in
" coc-settings.json

" settings
" ~~~~~~~~

" Update language server polling more frequently (default is 4000ms)
set updatetime=300

" Don't pass messages to completion menu
set shortmess+=c

augroup coc
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" Chill with error symbols, that's coc's job
let g:semshi#error_sign = v:false

lua <<EOF

-- nvim-treesitter for nice syntax highlighting

local treesitter = require 'nvim-treesitter.configs'
treesitter.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  }
}

-- LSP setup

local lspconfig = require 'lspconfig'
local coq = require 'coq'

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
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'kotlin_language_server',
  'vimls'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
  lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach_callback
  }))
end

EOF


" mappings
" ~~~~~~~~

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Search between errors
nmap <silent>gn <Plug>(coc-diagnostic-next)
nmap <silent>gN <Plug>(coc-diagnostic-prev)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Code formatting
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply AutoFix to problem on the current line.
nmap <leader>fx  <Plug>(coc-fix-current)

" Diagnostics mapping
nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b  :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c  :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l  :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o  :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s  :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>S  :<C-u>CocFzfList services<CR>
nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

" functions
" ~~~~~~~~~

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
