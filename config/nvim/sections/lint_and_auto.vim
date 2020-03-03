" Autocompletion and linting
" --------------------------

" autocompletion
" ~~~~~~~~~~~~~~
augroup ncm2_bufenter
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  autocmd Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-cmds',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'prefix', 'key': 'word'},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
  autocmd Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-labels',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'substr', 'key': 'word'},
        \               {'name': 'substr', 'key': 'menu'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#labels,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
  autocmd Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-files',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'abbrfuzzy', 'key': 'word'},
        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#files,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
  autocmd Filetype tex call ncm2#register_source({
        \ 'name' : 'bibtex',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'prefix', 'key': 'word'},
        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
        \               {'name': 'abbrfuzzy', 'key': 'menu'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
augroup end
set completeopt=noinsert,menuone,noselect


" linting and fixing
" ~~~~~~~~~~~~~~~~~~

" TODO remove this?
" Correct root for project needed for many linters
let g:rooter_patterns = ['.git/', 'build.xml', 'cargo.toml']

" When to lint
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Cooler warn/err symbols
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"

" Linters and fixers
let g:ale_fixers         = ['prettier']
let g:ale_linter_aliases = {'pandoc': ['markdown']}
let g:ale_linters        = {
      \'python':  ['pylint', 'flake8'],
      \'c':       ['gcc'],
      \'rust':    ['rls'],
      \'haskell': ['stack-ghc', 'hie']
      \}

" python
let g:ale_python_auto_pipenv = 1
let g:semshi#error_sign = v:false

" C
let g:ale_c_gcc_options = '-Wall -Wextra -Wpedantic -std=c11'

" Haskell
let g:ale_haskell_hie_executable = "/usr/bin/hie-wrapper"


" mappings
" ~~~~~~~~

" If auto completion suggestions are visible, tab acts differently
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Search between errors
nnoremap <silent> <leader>n <Plug>(ale_previous_warp)
nnoremap <silent> <leader>N <Plug>(ale_next_warp)
