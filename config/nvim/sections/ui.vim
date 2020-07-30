" User interface configuration
" ----------------------------

" standard stuff
" ~~~~~~~~~~~~~~
set relativenumber     " Relative line numbers from cursor line
set number             " ...and the line number of the cursor line

set signcolumn=yes     " Do not move text if signs are used

set scrolloff=7        " Minimum 7 lines from cursor when scrolling
set wrap               " Soft wrapping

set noshowmode         " airline shows mode for you
set cmdheight=1        " Height of the command line
set hidden             " Hide buffers when abandoned

set magic              " For regular expressions turn magic on
set showmatch          " Show matching brackets
set cursorline         " Show cursor line

set textwidth=99       " Set preferred maximum width to 99 columns
set colorcolumn=+1     " Highlighted column

set splitbelow         " Split below on horizontal split
set splitright         " Split to the right on vertical split

set inccommand=nosplit " Interactive substitutions

set viewoptions=cursor,folds,slash,unix
set viewoptions-=options
set foldmethod=marker

" Standard settings for tabs (expandtab set explicitly per filetype that
" needs it)
set softtabstop=4
set shiftwidth=4

" layout of FZF window
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

" colors
" ~~~~~~
set termguicolors

let g:space_vim_dark_background = 234 " Configure darker colour for...
colorscheme space-vim-dark            " ...a cool modern theme!
set background=dark

" More homogeneous background
highlight Conceal    ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE

" Colour column
highlight ColorColumn ctermbg=20 guibg=#303030


" encoding
" ~~~~~~~~
set encoding=utf8
set ffs=unix,dos,mac

set spelllang=en
set mouse=a


" syntax
" ~~~~~~
let g:load_doxygen_syntax = 1


" airline
" ~~~~~~~
let g:airline_theme = 'minimalist'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
" same theme for tmux
let g:tmuxline_powerline_separators = 1

let g:airline_extensions = [
      \'coc',
      \'branch',
      \'vimtex',
      \'tmuxline',
      \'fugitiveline']
let g:airline_section_x = '%{PencilMode()}'

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


" NERDTree
" ~~~~~~~~

" TODO Consider axing NERDTree. It's nice for visualisation, but FZF + buffer
" handling could be a better solution
noremap <leader>a :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.class$', '\.o$', '\.gch$', '\.png']
let NERDTreeWinSize = 22
