" Autocompletion and linting
" --------------------------

" Autocompletion
" ==============
augroup NCM2
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
set completeopt=noinsert,menuone,noselect


" Linting
" =======

" Correct root for project needed for many linters
let g:rooter_patterns = ['Makefile', '.git/', 'build.xml', 'cargo.toml']

let g:ale_lint_on_text_changed = 'never'

" python
let g:ale_python_linters = ['pylint', 'flake8']
let g:ale_python_pylint_auto_pipenv = 1
let g:ale_python_flake8_auto_pipenv = 1

" C
let g:ale_c_linters = ['gcc']
let g:ale_c_gcc_options = '-Wall -Wextra -Wpedantic -std=c11'

" Rust
let g:ale_rust_linters = ['rls']
"let g:ale_rust_fixers  = ['rustfmt']

" Haskell
let g:ale_haskell_linters = ['stack-ghc-mod', 'hlint']


" Mappings
" ========

" If auto completion suggestions are visible, tab acts differently
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-N>" : "\<S-Tab>"

" Search between errors
nnoremap <silent> <leader>n <Plug>(ale_previous_warp)
nnoremap <silent> <leader>N <Plug>(ale_next_warp)
