call plug#begin('~/.local/share/nvim/plugged')

Plug 'roxma/nvim-yarp' " No UpdateRemotePlugins


" auto-completion and linting
Plug 'ncm2/ncm2'         " Auto-completion framework, with modules...
Plug 'ncm2/ncm2-path'    " ...for paths
Plug 'ncm2/ncm2-pyclang' " ...for clang
Plug 'ncm2/ncm2-jedi'    " ...for python
Plug 'ncm2/ncm2-racer'   " ...for rust

Plug 'w0rp/ale'          " Linting and fixing framework


" a e s t h e t i c s
Plug 'vim-airline/vim-airline'        " Vim status bar replacement
Plug 'vim-airline/vim-airline-themes' " Themes for the status bar
Plug 'edkolev/tmuxline.vim'           " Copy airline to tmux
Plug 'Yggdroot/indentLine'            " Visual marks for indentation
Plug 'powerline/powerline'            " Powerline font integration
Plug 'liuchengxu/space-vim-dark'      " A nice and modern theme
Plug 'junegunn/goyo.vim'              " Distraction free mode
Plug 'junegunn/limelight.vim'         " Darken everything but paragraph


" syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " semshi = python syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'mboughaba/i3config.vim'
Plug 'cespare/vim-toml'
Plug 'chase/vim-ansible-yaml'


" productivity
Plug 'junegunn/vim-easy-align' " Format and align by patterns
Plug 'godlygeek/tabular'       " Align by patterns, used for vim-markdown
Plug 'haya14busa/is.vim'       " incsearch enhancement
Plug 'vim-pandoc/vim-pandoc'   " Cool functionality related to pandoc
Plug 'lervag/vimtex'           " Cool functionality related to latex
Plug 'airblade/vim-rooter'     " Set project root by looking for files
Plug 'tpope/vim-fugitive'      " In-editor git stuff
Plug 'gcmt/taboo.vim'          " Prettier tabs
Plug 'scrooloose/nerdtree'     " File tree
Plug 'embear/vim-localvimrc'   " Add settings per project
Plug 'plasticboy/vim-markdown' " Markdown functionality

call plug#end()
