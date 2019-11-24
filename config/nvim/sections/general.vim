" General configuration options
" -----------------------------

" Support for additional bindings
let mapleader = ","
let g:mapleader = ","

" Save buffer info
set shada^=%

set whichwrap=<,>,l,h,[,]
" Ignore compiled files
set wildignore=*.o,*~,*.pyc " ?

" Turn backup off, since most stuff is in SVN, git etc. anyway
set nobackup
set nowb
set noswapfile

augroup util
    autocmd!

    " Delete trailing whitespace
    autocmd BufWrite * :call DeleteTrailingWS()

    " Return to last edit position
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup end


" Mappings
" ========
nnoremap <leader>v :tabedit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ft :tabedit ~/.config/nvim/ftplugin/
nnoremap <leader>fs :tabedit ~/.config/nvim/sections/

nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>

" Turn off highlighting from hlsearch
noremap <silent> <leader><cr> :noh<cr>

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Treat long lines as break lines (useful when moving around in them)
noremap <silent> j gj
noremap <silent> k gk

" Arguably more accessible than ^
noremap 0 ^

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Switch between buffers in normal mode, nice utility
noremap <Tab> :bnext<cr>
noremap <S-Tab> :bprevious<cr>

" Close the current buffer and window
noremap <leader>q :bdelete<cr>
" Close just the buffer, not the window
noremap <leader>d :Bclose<cr>

" Smart way to move between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l


" vimgrep
" ~~~~~~~
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


" spelling
" ~~~~~~~~
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=
