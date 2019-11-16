" General configuration options
" -----------------------------

" Support for additional bindings
let mapleader = ","
let g:mapleader = ","

" Turn backup off, since most stuff is in SVN, git etc. anyway
set nobackup
set nowb
set noswapfile

" Mappings
nnoremap <leader>v :tabedit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ft :tabedit ~/.config/nvim/ftplugin/
nnoremap <leader>fs :tabedit ~/.config/nvim/sections/

" Toggle paste mode
map <leader>pp :setlocal paste!<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


map 0 ^
noremap <silent> <leader><cr> :noh<cr>

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Switch between buffers in normal mode
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc " ?
