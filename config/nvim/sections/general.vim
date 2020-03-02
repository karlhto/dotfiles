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

" Persistent undo
set undofile

" Super fast grep program written in rust
set grepprg=rg\ -n\ $*

augroup util
  autocmd!

  " Fix goyo trouble
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave silent! source $HOME/.vimrc

  " Delete trailing whitespace
  autocmd BufWrite * :call DeleteTrailingWS()
augroup end

" More Goyo fuck
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

" Mappings
" ========
nnoremap <leader>v  :tabedit ~/.config/nvim/init.vim<cr>
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
noremap <Tab>   :bnext<cr>
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

" Speedy file finding
nnoremap <leader>p  :FZF<cr>
nnoremap <leader>P  :FZF!<cr>
nnoremap <leader>ph :FZF ~<cr>


" vimgrep
" ~~~~~~~
" Do :help cope if you are unsure what cope is. It's super useful!
noremap <leader>cc :botright cope<cr>
noremap <leader>cn :cn<cr>
noremap <leader>cp :cp<cr>


" spelling
" ~~~~~~~~
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

" vimtex/pandoc
" ~~~~~~~~~~~~~

" tex
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:tex_fold_enabled = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1
if has('macunix')
  let g:vimtex_view_method = 'skim'
elseif has('unix')
  let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_compiler_progname = 'nvr'

" pandoc
let pandoc_fold_enabled = 1

" vim-pencil
" ~~~~~~~~~~
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType pandoc       call pencil#init()
  autocmd FileType tex          call pencil#init()
augroup END
