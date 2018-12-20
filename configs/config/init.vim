"============================================================================="
" init.vim
"============================================================================="

"============================================================================="
" => Plug
"============================================================================="
call plug#begin('~/.local/share/nvim/plugged')

" completion
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-clang'
Plug 'ncm2/ncm2-jedi'
Plug 'roxma/nvim-yarp'

" syntax checking and highlighting
Plug 'w0rp/ale'                     " fuk
Plug 'hashivim/vim-terraform'       " fuk
Plug 'aklt/plantuml-syntax'         " Syntax highlighting for plantuml
Plug 'numirias/semshi'              " Cool ass syntax highlighting for python
Plug 'vim-pandoc/vim-pandoc'        " Pandoc coolness
Plug 'vim-pandoc/vim-pandoc-syntax' " Pandoc syntax highlighting

" a e s t h e t i c s
Plug 'vim-airline/vim-airline'         " Vim status bar enhancement
Plug 'vim-airline/vim-airline-themes'  " Themes for the status bar
Plug 'nathanaelkane/vim-indent-guides' " Visual marks for indentation
Plug 'powerline/powerline'             " Powerline font integration
Plug 'liuchengxu/space-vim-dark'       " Cool theme
Plug 'junegunn/goyo.vim'               " Distraction free mode
Plug 'junegunn/limelight.vim'          " Cool ass highlighting shit yo
Plug 'junegunn/vim-easy-align'         " yeah

" productivity
Plug 'haya14busa/incsearch.vim'
Plug 'lervag/vimtex'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'gcmt/taboo.vim'
Plug 'scrooloose/nerdtree'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" misc
Plug 'fidian/hexmode'

call plug#end()


"============================================================================="
" => Autocompletion
"============================================================================="

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

"============================================================================="
" => Syntax checking
"============================================================================="
let g:rooter_patterns = ['Main.java', 'Makefile', '.git/', 'build.xml']

let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {'c': ['clang'], 'python': ['pylint', 'flake8']}
let g:ale_python_pylint_auto_pipenv = 1
let g:ale_python_flake8_auto_pipenv = 1

let g:ale_c_clang_options = '-std = c99 -Wall -Wextra -Wpedantic'

nmap <silent> <C-k> <Plug>(ale_previous_warp)
nmap <silent> <C-j> <Plug>(ale_next_warp)

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"============================================================================="
" => General
"============================================================================="
" Sets line-counting
set number
set relativenumber

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

map <leader>dw :%s/\s\+$//g<cr>

nmap <leader>v :tabedit ~/.vimrc<cr>

" vimtex
let g:tex_flavor = "latex"

"============================================================================="
" => VIM user interface
"============================================================================="
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" airline shows mode for you
set noshowmode

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Concealing
set conceallevel=2
let concealcursor = ""
let g:tex_conceal = "abdgm"
highlight Conceal ctermbg=200

"============================================================================="
" => Colors and Fonts
"============================================================================="
" Enable syntax highlighting
syntax enable
let g:load_doxygen_syntax = 1

" Fancy theme
let g:space_vim_dark_background = 234
color space-vim-dark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Complain when column passes 80
set colorcolumn=80
set spelllang=en
set mouse=a

" Line highlighting
set cursorline
highlight CursorLine guibg=#303030 ctermbg=236

" Indent highlighting
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"============================================================================="
" => Files, backups and undo
"============================================================================="
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"============================================================================="
" => Text, tab and indent related
"============================================================================="
" Use spaces instead of tabs
set autoindent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=-1

filetype plugin indent on

set expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set wrap "Wrap lines

let g:incsearch#auto_nohlsearch = 1

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

" Mapping for incsearch (plugin)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch between buffers
map <Tab> :bnext<cr>
map <S-Tab> :bprevious<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%


"============================================================================="
" => Status line
"============================================================================="
" Format the status line
let g:airline_theme = 'minimalist'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_extensions = ['branch', 'vimtex']

let g:airline_mode_map = {
            \ '__'  :   '-',
            \ 'n'   :   'N',
            \ 'i'   :   'I',
            \ 'R'   :   'R',
            \ 'c'   :   'C',
            \ 'v'   :   'V',
            \ 'V'   :   'V',
            \ 's'   :   'S',
            \ 'S'   :   'S',
            \ }

"============================================================================="
" => Editing mappings
"============================================================================="
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save
func! DeleteTrailingWS()
    if (&ft =~ 'pandoc' || &ft =~ 'tex')
        return
    endif

    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

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
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"============================================================================="
" => Spell checking
"============================================================================="
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"============================================================================="
" => Misc
"============================================================================="
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" NERDTree
map <leader>a :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.class$', '\.o$', '\.gch$', '\.png']
let NERDTreeWinSize = 22


"============================================================================="
" => Helper functions
"============================================================================="
function! CmdLine(str) abort
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

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
