-- vim: foldmethod=marker

-- {{{ options
-- {{{  1 important
-- }}}
-- {{{  2 moving around, searching and patterns
vim.opt.wrapscan = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- }}}
-- {{{  3 tags
-- }}}
-- {{{  4 displaying text
vim.opt.scrolloff = 5
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars.extends = ">"
vim.opt.listchars.precedes = "<"
vim.opt.listchars.tab = "\\_"
vim.opt.listchars.trail = "%"
-- }}}
-- {{{  5 syntax, highlighting and spelling
vim.opt.cursorline = true
-- }}}
-- {{{  6 multiple windows
-- }}}
-- {{{  7 multiple tab pages
-- }}}
-- {{{  8 terminal
-- }}}
-- {{{  9 using the mouse
-- }}}
-- {{{ 10 messages and info
-- }}}
-- {{{ 11 selecting text
vim.opt.clipboard:append("unnamed")
-- }}}
-- {{{ 12 editing text
-- }}}
vim.opt.showmatch = true
-- {{{ 13 tabs and indenting
-- }}}
-- {{{ 14 folding
-- }}}
-- {{{ 15 diff mode
-- }}}
-- {{{ 16 mapping
-- }}}
-- {{{ 17 reading and writing files
-- }}}
-- {{{ 18 the swap file
-- }}}
vim.opt.swapfile = false
-- {{{ 19 command line editing
-- }}}
-- {{{ 20 executing external commands
-- }}}
-- {{{ 21 running make and jumping to errors (quickfix)
-- }}}
-- {{{ 22 language specific
-- }}}
-- {{{ 23 multi-byte characters
-- }}}
-- {{{ 24 various
-- }}}
-- }}}

if vim.g.neovide then -- {{{
  vim.g.neovide_transparency = 0.7
  vim.g.neovide_cursor_vfx_mode = "railgun"
end -- }}}

vim.cmd("colorscheme torte")

vim.cmd("source " .. (vim.fn.expand("<script>:h:h") .. "/vim/dpp/init.vim"))
