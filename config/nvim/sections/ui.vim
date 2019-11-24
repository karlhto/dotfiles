" User interface configuration
" ----------------------------

" Standard stuff
" ==============
set relativenumber " Relative line numbers from cursor line
set number         " ...and the line number of the cursor line

set scrolloff=7    " Minimum 7 lines from cursor when scrolling
set wrap           " Soft wrapping

set noshowmode     " airline shows mode for you
set cmdheight=1    " Height of the command line
set hidden         " Hide buffers when abandoned

set magic          " For regular expressions turn magic on
set showmatch      " Show matching brackets
set cursorline     " Show cursor line
set colorcolumn=80 " Highlighted column

set splitbelow     " Split below on horizontal split
set splitright     " Split to the right on vertical split


" Colors
" ======
set termguicolors

let g:space_vim_dark_background = 234 " Configure darker colour for...
color space-vim-dark                  " ...a cool modern theme!

" More homogeneous background
highlight Conceal    ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE


" Encoding
" ========
set encoding=utf8
set ffs=unix,dos,mac

set spelllang=en
set mouse=a


" Syntax
" ======
let g:load_doxygen_syntax = 1


" Airline
" =======
let g:airline_theme = 'minimalist'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

let g:airline_extensions = ['ale', 'branch', 'vimtex', 'tmuxline', 'wordcount']
let g:airline#extensions#wordcount#filetypes = ['tex', 'pandoc', 'markdown']

let g:airline_mode_map = {
			\ '__'     : '-',
			\ 'c'      : 'C',
			\ 'i'      : 'I',
			\ 'ic'     : 'I',
			\ 'ix'     : 'I',
			\ 'n'      : 'N',
			\ 'multi'  : 'M',
			\ 'ni'     : 'N',
			\ 'no'     : 'N',
			\ 'R'      : 'R',
			\ 'Rv'     : 'R',
			\ 's'      : 'S',
			\ 'S'      : 'S',
			\ ''     : 'S',
			\ 't'      : 'T',
			\ 'v'      : 'V',
			\ 'V'      : 'V',
			\ ''     : 'V',
			\ }

let g:tmuxline_powerline_separators = 1
"let g:tmuxline_preset = 'minimalist'

" NERDTree
" ========
noremap <leader>a :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.class$', '\.o$', '\.gch$', '\.png']
let NERDTreeWinSize = 22
