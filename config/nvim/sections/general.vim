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
nnoremap <leader>vf :tabedit ~/.config/nvim/ftplugin/
nnoremap <leader>vs :tabedit ~/.config/nvim/sections/

" Toggle paste mode
map <leader>pp :setlocal paste!<cr>
