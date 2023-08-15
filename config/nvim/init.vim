" krrl's neovim config
" --------------------

" load all plugins
runtime sections/plug.vim

" cool functions
runtime sections/functions.vim

" general config
runtime sections/general.vim

" user interface
runtime sections/ui.vim

" language server configuration
lua require('lsp')

" treesitter
lua require('treesitter')
