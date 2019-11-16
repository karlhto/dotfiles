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

let g:rooter_patterns = ['Makefile', '.git/', 'build.xml', 'cargo.toml']

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"============================================================================="
" => Moving around, tabs, windows and buffers
"============================================================================="
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Switch between buffers in normal mode
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
augroup BFP
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

" Remember info about open buffers on close
set viminfo^=%

" Ignore compiled files
set wildignore=*.o,*~,*.pyc " ?

"============================================================================="
" => Editing mappings
"============================================================================="
" Remap VIM 0 to first non-blank character
map 0 ^
noremap <silent> <leader><cr> :noh<cr>

" Delete trailing white space on save
func! DeleteTrailingWS()
    if (&ft =~ 'pandoc' || &ft =~ 'tex')
        return
    endif

    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

augroup DTWS
    autocmd!
    autocmd BufWrite * :call DeleteTrailingWS()
augroup END

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


"============================================================================="
" => Misc
"============================================================================="

" NERDTree
noremap <leader>a :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.class$', '\.o$', '\.gch$', '\.png']
let NERDTreeWinSize = 22

"============================================================================="
" => Helper functions
"============================================================================="
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
