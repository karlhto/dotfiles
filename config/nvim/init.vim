" krrl's neovim config
" --------------------

" load all plugins
runtime sections/plug.vim

" general config
runtime sections/general.vim

" user interface
runtime sections/ui.vim

" linting and autocompletion engines
runtime sections/lint_and_auto.vim

" cool functions
runtime sections/functions.vim


"============================================================================="
" => vimgrep searching and cope displaying
"============================================================================="
" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
noremap <leader>cc :botright cope<cr>
noremap <leader>n :cn<cr>
noremap <leader>p :cp<cr>


"============================================================================="
" => Spell checking
"============================================================================="
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=
