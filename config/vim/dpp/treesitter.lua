-- lua_add {{{
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "vim",
  },
  sync_install = false,
  auto_install = false,
})
-- }}}
-- lua_post_update {{{
vim.cmd("TSUpdate")
-- }}}
