require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c","rust", "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "bash", "typescript", "java" },

  sync_install = false,

  auto_install = true,

  indent = {
    enable = true               -- Aktiviert die Tree-sitter-basierte Indentation
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}



local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
treesitter_parser_config.templ = {
    install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "master",
    },
}

vim.treesitter.language.register("templ", "templ")
