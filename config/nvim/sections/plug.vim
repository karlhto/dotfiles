" Plugins
" -------

set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'roxma/nvim-yarp' " No UpdateRemotePlugins


" auto-completion and linting
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'neovim/nvim-lspconfig' " Configurations for languase servers
Plug 'hrsh7th/cmp-nvim-lsp'  " Integration with autocompletion framework
Plug 'hrsh7th/cmp-buffer'    " ...also words in buffer
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'petertriho/cmp-git'


" lsp extensions
" ~~~~~~~~~~~~~~
Plug 'p00f/clangd_extensions.nvim'        " Cool clangd extensions for if I ever write C/C++ again
Plug 'MrcJkb/haskell-tools.nvim'          " Haskell tools!
Plug 'simrat39/rust-tools.nvim'           " For rust magic
Plug 'jose-elias-alvarez/typescript.nvim' " Typescript magic


" a e s t h e t i c s
" ~~~~~~~~~~~~~~~~~~~
Plug 'vim-airline/vim-airline'             " Vim status bar replacement
Plug 'vim-airline/vim-airline-themes'      " Themes for the status bar
Plug 'edkolev/tmuxline.vim'                " Copy airline to tmux
Plug 'powerline/powerline'                 " Powerline font integration
Plug 'liuchengxu/space-vim-dark'           " A nice and modern theme
Plug 'junegunn/goyo.vim'                   " Distraction free mode
Plug 'junegunn/limelight.vim'              " Darken everything but paragraph
Plug 'Konfekt/FastFold'                    " Faster folding
Plug 'lukas-reineke/indent-blankline.nvim' " Indent levels


" syntax/semantic highlighting
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " The biggest and bestest hightlighter
Plug 'sheerun/vim-polyglot'                                 " For all the stuff that nvim-treesitter doesn't do yet
Plug 'vim-pandoc/vim-pandoc-syntax'                         " pandoc shizz for md


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
Plug 'chase/vim-ansible-yaml'      " Ansible stuff
Plug 'udalov/kotlin-vim'           " Kotlin stuff

call plug#end()
