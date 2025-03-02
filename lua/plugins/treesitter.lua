require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "lua", "tsx", "javascript", "rust", "c", "cpp", "json", "java" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}