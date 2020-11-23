" Plugins
" -------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'roxma/nvim-yarp' " No UpdateRemotePlugins


" auto-completion and linting
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'neoclide/coc.nvim', {'branch': 'release'} " this plugin is jesus
Plug 'neovim/nvim-lspconfig'                    " maybe this will be more jesus
Plug 'nvim-lua/completion-nvim'                 " and this


" a e s t h e t i c s
" ~~~~~~~~~~~~~~~~~~~
Plug 'vim-airline/vim-airline'        " Vim status bar replacement
Plug 'vim-airline/vim-airline-themes' " Themes for the status bar

Plug 'edkolev/tmuxline.vim'           " Copy airline to tmux
Plug 'powerline/powerline'            " Powerline font integration
Plug 'liuchengxu/space-vim-dark'      " A nice and modern theme
Plug 'junegunn/goyo.vim'              " Distraction free mode
Plug 'junegunn/limelight.vim'         " Darken everything but paragraph
Plug 'Konfekt/FastFold'               " Faster folding


" syntax/semantic highlighting
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " semantic python hl
Plug 'jackguo380/vim-lsp-cxx-highlight'                " lsp highlighting


" productivity
" ~~~~~~~~~~~~
Plug 'junegunn/vim-easy-align'     " Format and align by patterns
Plug 'godlygeek/tabular'           " Align by patterns, used for vim-markdown
Plug 'haya14busa/is.vim'           " incsearch enhancement
Plug 'vim-pandoc/vim-pandoc'       " Cool functionality related to pandoc
Plug 'vim-pandoc/vim-pandoc-after' " Plugin integration
Plug 'lervag/vimtex'               " Cool functionality related to latex
Plug 'tpope/vim-fugitive'          " In-editor git stuff
Plug 'gcmt/taboo.vim'              " Prettier tabs
Plug 'scrooloose/nerdtree'         " File tree
Plug 'junegunn/fzf'                " Library stuff for fzf.vim
Plug 'junegunn/fzf.vim'            " Fuzzy file finding (gotta go fast)
Plug 'embear/vim-localvimrc'       " Add settings per project
Plug 'plasticboy/vim-markdown'     " Markdown functionality
Plug 'aserebryakov/vim-todo-lists' " Some todo list functionality
Plug 'reedes/vim-pencil'           " Vim can also be used for writing!
Plug 'zhimsel/vim-stay'            " Return where you belong
Plug 'antoinemadec/coc-fzf'        " Fzf integration with fzf
Plug 'chase/vim-ansible-yaml'      " Ansible stuff

call plug#end()
