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
set nowritebackup
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

  " OMNeT++ NED syntax
  autocmd BufNewFile,BufRead *.ned set syntax=ned ft=ned
augroup end

" More Goyo fuck
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction


" mappings
" ~~~~~~~~

" Convenience stuff for accessing config files
nnoremap <leader>v  :tabedit ~/.config/nvim/init.vim<cr>
nnoremap <leader>ft :tabedit ~/.config/nvim/ftplugin/
nnoremap <leader>fs :tabedit ~/.config/nvim/sections/

" In case of some change, re-source init.vim
nnoremap <leader>R :source ~/.config/nvim/init.vim<cr>

" Turn off highlighting from hlsearch
noremap <silent> <leader><cr> :noh<cr>

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Treat long lines as break lines (useful when moving around in them)
noremap <silent> j gj
noremap <silent> k gk

" Arguably more accessible than ^ (depending on layout)
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
nnoremap <C-p>  :FZF<cr>
nnoremap <leader>P  :FZF!<cr>
nnoremap <leader>ph :FZF ~<cr>
nnoremap <space><space> :Buffers<cr>

" Some resizing stuff for windows
nnoremap <silent> <leader>= :exe "resize " . (winheight(0) * 3/2)<cr>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<cr>


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


" vimtex
" ~~~~~~
"let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:tex_fold_enabled = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 0
if has('macunix')
  let g:vimtex_view_method = 'skim'
elseif has('unix')
  let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_compiler_progname = 'nvr'

" Disable matchparen for \big and the likes to stop the delay it creates
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_use_temp_files = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_quickfix_open_on_warning = 0

" Update the latexmk configuration to use Make to make missing files like PNGs
let g:vimtex_compiler_latexmk = {
			\ 'options' : [
			\	 '-verbose',
			\	 '-file-line-error',
			\	 '-synctex=1',
			\	 '-interaction=nonstopmode',
			\	 '-use-make',
			\ ],
			\}

let s:lbl_todo  = '✅D: '
let s:lbl_warn  = '⚡W: '
let s:lbl_fixme = '⛔F: '

let g:vimtex_toc_todo_labels = {
			\ 'TODO': s:lbl_todo,
			\ 'FIXME': s:lbl_fixme, }

let g:vimtex_toc_config = {
			\ 'show_help': 0,
			\ 'layer_status': {'content': 1, 'todo': 1, 'label': 1, 'fixme': 1},
			\ 'split_width': 30,
			\ 'tocdepth': 2
			\}

highlight VimtexTocSec0 ctermfg=301
highlight VimtexTocSec1 ctermfg=68
highlight VimtexTocSec2 ctermfg=60

" Make the great todos even better than before
let s:matcher_fixmes = {
      \ 're' : g:vimtex#re#not_comment . '\\fx\w*%(\[[^]]*\])?\{\zs.*',
      \ 'prefilter': '\fx',
      \ 'priority' : 2,
      \}

function! s:matcher_fixmes.get_entry(context) abort dict " {{{1
  let l:title = matchstr(a:context.line, self.re)
  let l:type = strpart(a:context.line, 3, 1)

  let [l:end, l:count] = s:find_closing(0, l:title, 1, '{')
  if l:count == 0
    let l:title = strpart(l:title, 0, l:end)
  else
    let self.count = l:count
    let s:matcher_continue = deepcopy(self)
  endif

  let l:types = {'w': s:lbl_warn, 'f': s:lbl_fixme }

  return {
        \ 'title'  : get(l:types, l:type, s:lbl_todo) . l:title,
		\ 'number' : '',
        \ 'file'   : a:context.file,
        \ 'line'   : a:context.lnum,
        \ 'level'  : a:context.max_level - a:context.level.current,
        \ 'rank'   : a:context.lnum_total,
        \ 'type'   : 'todo',
        \ }
endfunction

" }}}1
let g:vimtex_toc_custom_matchers = [ s:matcher_fixmes ]

function! s:find_closing(start, string, count, type) abort " {{{1
  if a:type ==# '{'
    let l:re = '{\|}'
    let l:open = '{'
  else
    let l:re = '\[\|\]'
    let l:open = '['
  endif
  let l:i2 = a:start-1
  let l:count = a:count
  while l:count > 0
    let l:i2 = match(a:string, l:re, l:i2+1)
    if l:i2 < 0 | break | endif

    if a:string[l:i2] ==# l:open
      let l:count += 1
    else
      let l:count -= 1
    endif
  endwhile

  return [l:i2, l:count]
endfunction


" pandoc
" ~~~~~~

" Formatting
let g:pandoc#formatting#mode = 's'
" Quci latex-command generation
let g:pandoc#command#autoexec_command = 'Pandoc pdf'
" lualatex default engine
let g:pandoc#command#latex_engine = 'lualatex'
let g:pandoc#keyboard#sections#header_style = 's'
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#mode = 'stacked'
let g:pandoc#biblio#bibs = ['bibliography.bib']
let g:pandoc#after#modules#enabled = ['fastfold']

if executable('pandoc-citeproc')
  " Use citeproc backend for searching in bibliographies
	let g:pandoc#completion#bib#mode = 'citeproc'
	" Use previews in the information
	let g:pandoc#completion#bib#use_preview = 1
endif


" vim-pencil
" ~~~~~~~~~~
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#joinspaces = 1
let g:pencil#conceallevel = 2

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType pandoc       call pencil#init()
  autocmd FileType tex          call pencil#init()
augroup END
