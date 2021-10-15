require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "html", "typescript", "javascript", "elixir" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
