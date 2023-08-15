-- nvim-treesitter for nice syntax highlighting
local treesitter = require 'nvim-treesitter.configs'
treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "tex", "latex" },
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  }
}
